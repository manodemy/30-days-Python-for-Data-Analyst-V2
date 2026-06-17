import { NextResponse } from 'next/server';
import path from 'path';
import fs from 'fs';
import Database from 'better-sqlite3';

export const dynamic = 'force-dynamic';

const ALLOWED_DBS = ['retail.db', 'company.db', 'ecommerce.db', 'capstone_retail.db'];

function cleanSql(sql: string): string {
  // Remove multi-line comments
  let cleaned = sql.replace(/\/\*[\s\S]*?\*\//g, '');
  // Remove single-line comments
  cleaned = cleaned
    .split('\n')
    .map(line => line.replace(/--.*$/, ''))
    .join('\n');
  return cleaned.trim();
}

export async function POST(req: Request) {
  try {
    const { query, dbName } = await req.json();

    if (!dbName || !ALLOWED_DBS.includes(dbName)) {
      return NextResponse.json(
        { error: `Invalid or missing database name. Must be one of: ${ALLOWED_DBS.join(', ')}` },
        { status: 400 }
      );
    }

    if (!query || typeof query !== 'string') {
      return NextResponse.json(
        { error: 'Missing or invalid SQL query.' },
        { status: 400 }
      );
    }

    const sql = cleanSql(query);
    if (!sql) {
      return NextResponse.json(
        { error: 'SQL query cannot be empty.' },
        { status: 400 }
      );
    }

    // Strict syntax guard for read-only statements
    const lowerSql = sql.toLowerCase();
    const isReadQuery = lowerSql.startsWith('select') || lowerSql.startsWith('with') || lowerSql.startsWith('explain');
    if (!isReadQuery) {
      return NextResponse.json(
        { error: 'Security constraint: Only read-only queries (SELECT, WITH, EXPLAIN) are allowed.' },
        { status: 403 }
      );
    }

    const dbPath = path.join(process.cwd(), 'public', 'sql-data', dbName);
    if (!fs.existsSync(dbPath)) {
      return NextResponse.json(
        { error: `Database file ${dbName} not found on server.` },
        { status: 404 }
      );
    }

    // Open database in read-only mode
    let db;
    try {
      db = new Database(dbPath, { readonly: true, fileMustExist: true });
    } catch (err: any) {
      console.error('Failed to open SQLite database:', err);
      return NextResponse.json(
        { error: `Failed to connect to database: ${err.message}` },
        { status: 500 }
      );
    }

    try {
      // Execute query
      const stmt = db.prepare(sql);
      let rows: any[] = [];
      
      rows = stmt.all();

      // Close database connection
      db.close();

      // Extract column names if we have rows, or prepare it from statement columns
      let columns: string[] = [];
      if (rows.length > 0) {
        columns = Object.keys(rows[0]);
      } else {
        try {
          if (typeof stmt.columns === 'function') {
            columns = stmt.columns().map((c: any) => c.name);
          }
        } catch (colErr) {
          // ignore column mapping errors on non-select statements
        }
      }

      return NextResponse.json({
        columns,
        rows
      });
    } catch (execErr: any) {
      if (db) {
        db.close();
      }
      return NextResponse.json(
        { error: execErr.message },
        { status: 400 }
      );
    }
  } catch (err: any) {
    console.error('API /api/sql Error:', err);
    return NextResponse.json(
      { error: err.message || 'Internal Server Error' },
      { status: 500 }
    );
  }
}

import pathlib

path = pathlib.Path('public/admin.html')
content = path.read_text(encoding='utf-8')

clean_tab_pricing_html = '''        <!-- ══ TAB 4: PRICING & COUPONS COMMAND CENTER ══ -->
        <div class="tab-pane" id="tab-pricing">

          <!-- 1. DUAL-CURRENCY MATRIX OVERVIEW -->
          <div id="moduleMasterMatrix" style="background: var(--elevated); border: 1px solid var(--rim); border-radius: var(--radius-lg); padding: 1.25rem; margin-bottom: 1.25rem;">
            <div style="font-family: var(--font-display); font-size: 1.05rem; font-weight: 700; color: var(--ink); margin-bottom: 1rem; display: flex; align-items: center; justify-content: space-between;">
              <span>🌐 Master Pricing Matrix</span>
            </div>

            <div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(280px, 1fr)); gap: 1rem;">
              <div style="background: var(--base); border: 1px solid var(--rim); border-radius: var(--radius-md); padding: 1rem 1.25rem;">
                <div style="font-size: 0.8rem; font-weight: 700; color: var(--gold); margin-bottom: 0.5rem; display: flex; align-items: center; justify-content: space-between;">
                  <span>🇮🇳 India Domestic (INR)</span>
                  <span class="badge badge-emerald" style="font-size: 0.62rem; padding: 1px 6px;">Razorpay / UPI</span>
                </div>
                <div style="font-size: 1.5rem; font-weight: 800; color: var(--ink); font-family: var(--font-data);" id="matrixInrPrice">
                  ₹1,499 <span style="font-size: 0.85rem; color: var(--ink-dim); text-decoration: line-through;" id="matrixInrOrig">₹4,999</span>
                </div>
                <div style="font-size: 0.75rem; color: var(--emerald); font-weight: 600; margin-top: 0.3rem;" id="matrixInrBadge">70% OFF (You save ₹3,500)</div>
              </div>

              <div style="background: var(--base); border: 1px solid var(--rim); border-radius: var(--radius-md); padding: 1rem 1.25rem;">
                <div style="font-size: 0.8rem; font-weight: 700; color: var(--sapphire); margin-bottom: 0.5rem; display: flex; align-items: center; justify-content: space-between;">
                  <span>🌍 Outside India (USD)</span>
                  <span class="badge badge-sapphire" style="font-size: 0.62rem; padding: 1px 6px;">PayPal / Stripe</span>
                </div>
                <div style="font-size: 1.5rem; font-weight: 800; color: var(--ink); font-family: var(--font-data);" id="matrixUsdPrice">
                  $49 <span style="font-size: 0.85rem; color: var(--ink-dim); text-decoration: line-through;" id="matrixUsdOrig">$149</span>
                </div>
                <div style="font-size: 0.75rem; color: var(--emerald); font-weight: 600; margin-top: 0.3rem;" id="matrixUsdBadge">67% OFF (You save $100)</div>
              </div>
            </div>
          </div>

          <!-- 2. REGION SWITCHER TABS -->
          <div style="display: flex; align-items: center; justify-content: space-between; flex-wrap: wrap; gap: 0.75rem; margin-bottom: 1.25rem; background: var(--elevated); padding: 0.35rem 0.5rem; border-radius: var(--radius-md); border: 1px solid var(--rim);">
            <div style="display: flex; align-items: center; gap: 0.4rem;">
              <button class="region-tab-btn active" id="btnRegionInr" type="button" onclick="switchPricingRegion('INR')" style="padding: 0.45rem 1.1rem; font-size: 0.82rem; font-weight: 600; border-radius: var(--radius-sm); border: 1px solid transparent; cursor: pointer; transition: all var(--transition); background: var(--gold); color: var(--void);">
                🇮🇳 India (INR ₹)
              </button>
              <button class="region-tab-btn" id="btnRegionUsd" type="button" onclick="switchPricingRegion('USD')" style="padding: 0.45rem 1.1rem; font-size: 0.82rem; font-weight: 600; border-radius: var(--radius-sm); border: 1px solid var(--rim); cursor: pointer; transition: all var(--transition); background: transparent; color: var(--ink-dim);">
                🌍 Outside India (USD $)
              </button>
            </div>
            <div style="font-size: 0.72rem; color: var(--ink-muted); font-family: var(--font-data); padding-right: 0.5rem;">
              Gateway: <strong id="pricingActiveGatewayLabel" style="color: var(--sapphire);">Razorpay &amp; UPI</strong>
            </div>
          </div>

          <!-- 3. CONFIGURATOR & LIVE STUDENT SIMULATOR -->
          <div id="moduleMasterPricing" style="display: grid; grid-template-columns: repeat(auto-fit, minmax(340px, 1fr)); gap: 1.25rem; margin-bottom: 1.5rem;">
            
            <!-- Left Card: Live Pricing Configurator -->
            <div style="background: var(--elevated); border: 1px solid var(--rim); border-radius: var(--radius-lg); padding: 1.25rem; position: relative;">
              <div style="margin-bottom: 1rem;">
                <h3 style="font-family: var(--font-display); font-size: 1.05rem; font-weight: 700; color: var(--ink);">
                  <span id="cfgRegionFlag">🇮🇳</span> <span id="cfgRegionTitle">India Domestic Pricing</span>
                </h3>
              </div>

              <form id="masterPricingForm" onsubmit="event.preventDefault(); openPublishConfirmModal();">
                <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 0.75rem; margin-bottom: 0.75rem;">
                  <div class="field">
                    <label style="font-size: 0.72rem; color: var(--ink-dim); margin-bottom: 0.3rem; display: block;">
                      Sale Price (<span class="curr-symbol">₹</span>) *
                    </label>
                    <input id="cfg_sale_price" type="number" step="any" min="1" placeholder="1499" required
                      style="font-family: var(--font-price); font-size: 1.05rem; font-weight: 700; color: var(--emerald); background: var(--base); border: 1px solid var(--rim); padding: 0.55rem 0.75rem; border-radius: var(--radius-sm); width: 100%;" />
                  </div>

                  <div class="field">
                    <label style="font-size: 0.72rem; color: var(--ink-dim); margin-bottom: 0.3rem; display: block;">
                      Original Price (<span class="curr-symbol">₹</span>) *
                    </label>
                    <input id="cfg_original_price" type="number" step="any" min="1" placeholder="4999" required
                      style="font-family: var(--font-price); font-size: 1.05rem; font-weight: 500; color: var(--ink-dim); text-decoration: line-through; background: var(--base); border: 1px solid var(--rim); padding: 0.55rem 0.75rem; border-radius: var(--radius-sm); width: 100%;" />
                  </div>
                </div>

                <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 0.75rem; margin-bottom: 1rem;">
                  <div class="field">
                    <label style="font-size: 0.72rem; color: var(--ink-dim); margin-bottom: 0.3rem; display: block;">
                      Discount Badge
                    </label>
                    <input id="cfg_discount_badge" type="text" placeholder="70% OFF"
                      style="font-family: var(--font-data); font-size: 0.85rem; font-weight: 600; color: var(--gold); background: var(--base); border: 1px solid var(--rim); padding: 0.55rem 0.75rem; border-radius: var(--radius-sm); width: 100%;" />
                  </div>

                  <div class="field">
                    <label style="font-size: 0.72rem; color: var(--ink-dim); margin-bottom: 0.3rem; display: block;">
                      Campaign Label
                    </label>
                    <input id="cfg_preset_label" type="text" placeholder="e.g. Early Access Offer"
                      style="font-size: 0.82rem; color: var(--ink); background: var(--base); border: 1px solid var(--rim); padding: 0.55rem 0.75rem; border-radius: var(--radius-sm); width: 100%;" />
                  </div>
                </div>

                <!-- 1-Click Quick Presets -->
                <div style="margin-bottom: 1.25rem; background: var(--base); padding: 0.65rem 0.75rem; border-radius: var(--radius-sm); border: 1px solid var(--rim-subtle);">
                  <div style="font-size: 0.65rem; text-transform: uppercase; letter-spacing: 0.08em; color: var(--ink-muted); margin-bottom: 0.4rem; font-weight: 600;">
                    ⚡ Quick Presets
                  </div>
                  <div id="cfgPresetButtons" style="display: flex; flex-wrap: wrap; gap: 0.35rem;">
                    <!-- Presets inserted via JS -->
                    <button type="button" class="btn-preset inr-preset" onclick="applyPresetPrice(1499, 4999, '70% OFF', 'Early Access Offer')" style="font-size: 0.7rem; padding: 0.3rem 0.6rem; border-radius: 4px; background: rgba(255,255,255,0.04); border: 1px solid var(--rim); color: var(--ink); cursor: pointer;">
                      ⚡ Default 70% (₹1,499)
                    </button>
                    <button type="button" class="btn-preset inr-preset" onclick="applyPresetPrice(999, 4999, '80% OFF', 'Flash Sale Deal')" style="font-size: 0.7rem; padding: 0.3rem 0.6rem; border-radius: 4px; background: rgba(255,255,255,0.04); border: 1px solid var(--rim); color: var(--emerald); cursor: pointer;">
                      🔥 Super Deal (₹999)
                    </button>
                    <button type="button" class="btn-preset inr-preset" onclick="applyPresetPrice(2499, 4999, '50% OFF', 'Standard Admission')" style="font-size: 0.7rem; padding: 0.3rem 0.6rem; border-radius: 4px; background: rgba(255,255,255,0.04); border: 1px solid var(--rim); color: var(--gold); cursor: pointer;">
                      💎 Regular (₹2,499)
                    </button>
                    <button type="button" class="btn-preset inr-preset" onclick="applyPresetPrice(499, 4999, '90% OFF', 'Launch Special')" style="font-size: 0.7rem; padding: 0.3rem 0.6rem; border-radius: 4px; background: rgba(255,255,255,0.04); border: 1px solid var(--rim); color: var(--sapphire); cursor: pointer;">
                      🚀 Launch (₹499)
                    </button>
                  </div>
                </div>

                <!-- Publish Action -->
                <div style="display: flex; align-items: center; justify-content: flex-end; border-top: 1px solid var(--rim); padding-top: 1rem;">
                  <button class="btn-gold" id="btnPublishPricing" type="submit" style="font-size: 0.85rem; font-weight: 700; padding: 0.6rem 1.35rem; display: inline-flex; align-items: center; gap: 0.4rem; border-radius: var(--radius-sm); cursor: pointer;">
                    <span>🚀 Confirm &amp; Publish to Cloud</span>
                  </button>
                </div>
              </form>
            </div>

            <!-- Right Card: Live Student View Simulator -->
            <div style="background: var(--elevated); border: 1px solid var(--rim); border-radius: var(--radius-lg); padding: 1.25rem; display: flex; flex-direction: column; justify-content: space-between;">
              <div>
                <div style="margin-bottom: 1rem;">
                  <h3 style="font-family: var(--font-display); font-size: 1.05rem; font-weight: 700; color: var(--ink);">
                    👁️ Student View Simulator
                  </h3>
                </div>

                <!-- Simulated Landing Card Container -->
                <div id="simulatedStudentCard" style="background: var(--base); border: 1px solid var(--rim-strong); border-radius: var(--radius-md); padding: 1.25rem; position: relative;">
                  <div style="position: absolute; top: -10px; right: 12px;">
                    <span id="simDiscountBadge" style="background: linear-gradient(135deg, #10b981, #059669); color: #fff; font-size: 0.68rem; font-weight: 800; padding: 2px 8px; border-radius: 9999px; letter-spacing: 0.04em;">
                      70% OFF
                    </span>
                  </div>

                  <div style="font-size: 0.7rem; text-transform: uppercase; letter-spacing: 0.1em; color: var(--gold); font-weight: 700; margin-bottom: 0.3rem;">
                    60-DAY SELF-PACED MASTERCLASS
                  </div>
                  <div style="display: flex; align-items: baseline; gap: 0.5rem; margin-bottom: 0.5rem;">
                    <span id="simSalePrice" style="font-family: var(--font-price); font-size: 1.8rem; font-weight: 800; color: var(--ink); letter-spacing: -0.02em;">
                      ₹1,499
                    </span>
                    <span id="simOriginalPrice" style="font-family: var(--font-price); font-size: 1rem; color: var(--ink-dim); text-decoration: line-through;">
                      ₹4,999
                    </span>
                    <span style="font-size: 0.7rem; color: var(--ink-dim);">one-time</span>
                  </div>

                  <div style="background: rgba(16, 185, 129, 0.08); border: 1px solid rgba(16, 185, 129, 0.2); border-radius: var(--radius-sm); padding: 0.4rem 0.65rem; font-size: 0.75rem; color: var(--emerald); font-weight: 600; display: flex; align-items: center; gap: 0.35rem; margin-bottom: 0.85rem;">
                    <span>🎉</span>
                    <span id="simSavingsCallout">You save ₹3,500 with this lifetime pass</span>
                  </div>

                  <ul style="list-style: none; padding: 0; margin: 0 0 1rem 0; font-size: 0.72rem; color: var(--ink-dim); line-height: 1.7;">
                    <li style="display:flex; align-items:center; gap:0.35rem;">✅ <span>All 3 Tracks: SQL + Excel + Python</span></li>
                    <li style="display:flex; align-items:center; gap:0.35rem;">✅ <span>1,000+ browser-based challenges &amp; audio guide</span></li>
                    <li style="display:flex; align-items:center; gap:0.35rem;">✅ <span>Verified certificate &amp; portfolio projects</span></li>
                  </ul>

                  <button type="button" style="width: 100%; background: var(--gold); color: var(--void); font-weight: 700; font-size: 0.82rem; padding: 0.6rem; border-radius: var(--radius-sm); border: none; cursor: default; display: flex; align-items: center; justify-content: center; gap: 0.4rem;">
                    <span>Enroll in Masterclass</span>
                    <span id="simCtaPrice">₹1,499</span>
                  </button>
                </div>
              </div>
            </div>
          </div>

          <!-- 4. COUPON COMMAND CENTER ACCORDION -->
          <div class="accordion-card" style="background: var(--elevated); border: 1px solid var(--rim); border-radius: var(--radius-lg); margin-bottom: 1.25rem; overflow: hidden;">
            <div class="accordion-header" onclick="toggleAccordion('accCouponContent', 'accCouponIcon')" style="padding: 1rem 1.25rem; display: flex; align-items: center; justify-content: space-between; cursor: pointer; user-select: none; background: rgba(255,255,255,0.015); border-bottom: 1px solid var(--rim);">
              <div style="display: flex; align-items: center; gap: 0.6rem;">
                <span style="font-size: 1.1rem;">🎟️</span>
                <h3 style="font-family: var(--font-display); font-size: 0.98rem; font-weight: 700; color: var(--ink); margin: 0;">
                  Coupon Command Center
                </h3>
              </div>
              <div style="display: flex; align-items: center; gap: 0.6rem;">
                <span class="badge badge-emerald" id="activeCouponsCountBadge" style="font-size: 0.65rem; padding: 2px 7px; border-radius: 9999px;">
                  3 Active
                </span>
                <span id="accCouponIcon" style="font-size: 0.9rem; color: var(--gold); transition: transform 0.2s;">▾</span>
              </div>
            </div>

            <div id="accCouponContent" style="padding: 1.25rem;">
              <div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(320px, 1fr)); gap: 1.25rem; margin-bottom: 1.5rem;">
                
                <!-- Left: Coupon Creator Form -->
                <div style="background: var(--base); border: 1px solid var(--rim); border-radius: var(--radius-md); padding: 1.1rem;">
                  <div style="font-size: 0.82rem; font-weight: 700; color: var(--gold); margin-bottom: 0.85rem; display: flex; align-items: center; justify-content: space-between;">
                    <span>Create Promo Code</span>
                    <button type="button" onclick="autoGenerateCouponCode()" style="font-size: 0.65rem; background: var(--elevated); border: 1px solid var(--rim); color: var(--sapphire); padding: 2px 7px; border-radius: 4px; cursor: pointer;">
                      ⚡ Auto Code
                    </button>
                  </div>

                  <form id="couponCreatorForm" onsubmit="event.preventDefault(); handleCreateCoupon();">
                    <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 0.65rem; margin-bottom: 0.65rem;">
                      <div class="field">
                        <label style="font-size: 0.7rem; color: var(--ink-dim);">Promo Code *</label>
                        <input id="new_coupon_code" type="text" placeholder="e.g. DATA50" required
                          style="text-transform: uppercase; font-family: var(--font-data); font-weight: 700; letter-spacing: 0.08em; color: var(--ink); background: var(--elevated); border: 1px solid var(--rim); padding: 0.45rem 0.65rem; border-radius: var(--radius-sm); width: 100%;" />
                      </div>
                      <div class="field">
                        <label style="font-size: 0.7rem; color: var(--ink-dim);">Discount Mode *</label>
                        <select id="new_coupon_mode" onchange="updateCouponModeLabel()"
                          style="font-size: 0.78rem; color: var(--ink); background: var(--elevated); border: 1px solid var(--rim); padding: 0.45rem 0.65rem; border-radius: var(--radius-sm); width: 100%;">
                          <option value="PERCENT">% Percentage Off</option>
                          <option value="FIXED_INR">₹ Flat Discount (INR)</option>
                          <option value="FIXED_USD">$ Flat Discount (USD)</option>
                        </select>
                      </div>
                    </div>

                    <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 0.65rem; margin-bottom: 0.65rem;">
                      <div class="field">
                        <label id="couponValueInputLabel" style="font-size: 0.7rem; color: var(--ink-dim);">Discount Value (%) *</label>
                        <input id="new_coupon_value" type="number" step="any" min="1" placeholder="50" required
                          style="font-family: var(--font-data); font-weight: 700; color: var(--emerald); background: var(--elevated); border: 1px solid var(--rim); padding: 0.45rem 0.65rem; border-radius: var(--radius-sm); width: 100%;" />
                      </div>
                      <div class="field">
                        <label style="font-size: 0.7rem; color: var(--ink-dim);">Currency Scope</label>
                        <select id="new_coupon_scope"
                          style="font-size: 0.78rem; color: var(--ink); background: var(--elevated); border: 1px solid var(--rim); padding: 0.45rem 0.65rem; border-radius: var(--radius-sm); width: 100%;">
                          <option value="BOTH">Both (INR ₹ &amp; USD $)</option>
                          <option value="INR">INR Only (India)</option>
                          <option value="USD">USD Only (Global)</option>
                        </select>
                      </div>
                    </div>

                    <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 0.65rem; margin-bottom: 0.65rem;">
                      <div class="field">
                        <label style="font-size: 0.7rem; color: var(--ink-dim);">Max Uses Cap</label>
                        <input id="new_coupon_max_uses" type="number" min="1" placeholder="∞ Unlimited"
                          style="font-family: var(--font-data); font-size: 0.78rem; color: var(--ink); background: var(--elevated); border: 1px solid var(--rim); padding: 0.45rem 0.65rem; border-radius: var(--radius-sm); width: 100%;" />
                      </div>
                      <div class="field">
                        <label style="font-size: 0.7rem; color: var(--ink-dim);">Expiration Date</label>
                        <input id="new_coupon_expires" type="date"
                          style="font-size: 0.78rem; color: var(--ink); background: var(--elevated); border: 1px solid var(--rim); padding: 0.45rem 0.65rem; border-radius: var(--radius-sm); width: 100%;" />
                      </div>
                    </div>

                    <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 0.65rem; margin-bottom: 0.85rem;">
                      <div class="field">
                        <label style="font-size: 0.7rem; color: var(--ink-dim);">Campaign Tag</label>
                        <input id="new_coupon_tag" type="text" placeholder="e.g. launch_deal"
                          style="font-size: 0.78rem; color: var(--ink); background: var(--elevated); border: 1px solid var(--rim); padding: 0.45rem 0.65rem; border-radius: var(--radius-sm); width: 100%;" />
                      </div>
                      <div class="field" style="display: flex; align-items: center; gap: 0.4rem; margin-top: 1.1rem;">
                        <input id="new_coupon_single_email" type="checkbox" style="cursor: pointer;" />
                        <label for="new_coupon_single_email" style="font-size: 0.7rem; color: var(--ink); cursor: pointer;">
                          1 use per email
                        </label>
                      </div>
                    </div>

                    <button class="btn-gold" id="btnSaveCoupon" type="submit" style="width: 100%; font-size: 0.82rem; font-weight: 700; padding: 0.55rem; border-radius: var(--radius-sm); cursor: pointer;">
                      + Create &amp; Activate Coupon
                    </button>
                  </form>
                </div>

                <!-- Right: Test Sandbox & Auto-Apply Link -->
                <div style="background: var(--base); border: 1px solid var(--rim); border-radius: var(--radius-md); padding: 1.1rem; display: flex; flex-direction: column; justify-content: space-between;">
                  <div>
                    <div style="font-size: 0.82rem; font-weight: 700; color: var(--sapphire); margin-bottom: 0.75rem;">
                      🧪 Coupon Test Sandbox
                    </div>

                    <div style="display: flex; gap: 0.4rem; margin-bottom: 0.85rem;">
                      <input id="sandboxCouponInput" type="text" placeholder="Code (e.g. DATA50)"
                        style="text-transform: uppercase; font-family: var(--font-data); font-weight: 700; letter-spacing: 0.08em; color: var(--ink); background: var(--elevated); border: 1px solid var(--rim); padding: 0.45rem 0.65rem; border-radius: var(--radius-sm); flex-grow: 1;" />
                      <button type="button" onclick="runSandboxTest()" class="btn-outline-gold" style="font-size: 0.75rem; padding: 0.45rem 0.85rem;">
                        Test Code
                      </button>
                    </div>

                    <!-- Sandbox Result Box -->
                    <div id="sandboxResultBox" style="background: var(--elevated); border: 1px solid var(--rim); border-radius: var(--radius-sm); padding: 0.85rem; margin-bottom: 1rem;">
                      <div style="display: flex; align-items: center; justify-content: space-between; margin-bottom: 0.4rem;">
                        <span style="font-size: 0.72rem; color: var(--ink-dim);">Status:</span>
                        <span class="badge badge-emerald" id="sbxStatusBadge" style="font-size: 0.65rem;">READY</span>
                      </div>
                      <div style="display: flex; align-items: center; justify-content: space-between; margin-bottom: 0.35rem;">
                        <span style="font-size: 0.72rem; color: var(--ink-dim);">Base Price:</span>
                        <span style="font-family: var(--font-data); font-weight: 600; color: var(--ink); font-size: 0.8rem;" id="sbxBasePrice">₹1,499</span>
                      </div>
                      <div style="display: flex; align-items: center; justify-content: space-between; margin-bottom: 0.35rem;">
                        <span style="font-size: 0.72rem; color: var(--ink-dim);">Discount:</span>
                        <span style="font-family: var(--font-data); font-weight: 600; color: var(--emerald); font-size: 0.8rem;" id="sbxDiscountAmount">-₹0</span>
                      </div>
                      <div style="display: flex; align-items: center; justify-content: space-between; border-top: 1px solid var(--rim); padding-top: 0.4rem; margin-top: 0.4rem;">
                        <span style="font-size: 0.78rem; font-weight: 700; color: var(--ink);">Student Payable:</span>
                        <span style="font-family: var(--font-data); font-size: 1.15rem; font-weight: 800; color: var(--gold);" id="sbxFinalPrice">₹1,499</span>
                      </div>
                    </div>
                  </div>

                  <!-- Auto-Apply Link -->
                  <div style="background: rgba(59, 130, 246, 0.04); border: 1px solid rgba(59, 130, 246, 0.15); border-radius: var(--radius-sm); padding: 0.65rem;">
                    <div style="font-size: 0.65rem; text-transform: uppercase; letter-spacing: 0.08em; color: var(--sapphire); font-weight: 700; margin-bottom: 0.3rem;">
                      🔗 Auto-Apply Link
                    </div>
                    <div style="display: flex; align-items: center; gap: 0.4rem;">
                      <input id="shareableLinkUrl" type="text" readonly value="https://www.manodemy.com/?coupon=DATA50"
                        style="font-family: var(--font-data); font-size: 0.7rem; color: var(--ink-dim); background: var(--base); border: 1px solid var(--rim); padding: 0.4rem 0.55rem; border-radius: 4px; flex-grow: 1;" />
                      <button type="button" onclick="copyShareableLink()" class="btn-outline-gold" style="font-size: 0.7rem; padding: 0.4rem 0.65rem; white-space: nowrap;">
                        📋 Copy Link
                      </button>
                    </div>
                  </div>
                </div>
              </div>

              <!-- Active Coupons Table Panel -->
              <div class="table-panel">
                <div class="table-panel-header" style="display: flex; align-items: center; justify-content: space-between;">
                  <span class="table-panel-title">Active Coupons</span>
                  <div style="display: flex; align-items: center; gap: 0.4rem;">
                    <input id="couponSearchInput" type="text" placeholder="Search code..." oninput="filterCouponsTable()"
                      style="font-size: 0.72rem; background: var(--base); border: 1px solid var(--rim); padding: 0.3rem 0.65rem; border-radius: var(--radius-sm); color: var(--ink);" />
                  </div>
                </div>
                <div class="table-wrap">
                  <table id="activeCouponsTable">
                    <thead>
                      <tr>
                        <th>Code</th>
                        <th>Value</th>
                        <th>Currency</th>
                        <th>Redemptions</th>
                        <th>Status</th>
                        <th>Expires</th>
                        <th>Tag</th>
                        <th>Link</th>
                        <th>Actions</th>
                      </tr>
                    </thead>
                    <tbody id="activeCouponsTbody">
                      <!-- Populated via JavaScript -->
                    </tbody>
                  </table>
                </div>
              </div>
            </div>
          </div>

          <!-- 5. PRICE AUDIT LOG ACCORDION -->
          <div class="accordion-card" style="background: var(--elevated); border: 1px solid var(--rim); border-radius: var(--radius-lg); margin-bottom: 1.25rem; overflow: hidden;">
            <div class="accordion-header" onclick="toggleAccordion('accAuditContent', 'accAuditIcon')" style="padding: 1rem 1.25rem; display: flex; align-items: center; justify-content: space-between; cursor: pointer; user-select: none; background: rgba(255,255,255,0.015); border-bottom: 1px solid var(--rim);">
              <div style="display: flex; align-items: center; gap: 0.6rem;">
                <span style="font-size: 1.1rem;">📜</span>
                <h3 style="font-family: var(--font-display); font-size: 0.98rem; font-weight: 700; color: var(--ink); margin: 0;">
                  Price Audit Log
                </h3>
              </div>
              <div style="display: flex; align-items: center; gap: 0.6rem;">
                <span class="badge badge-gold" id="auditLogCountBadge" style="font-size: 0.65rem; padding: 2px 7px; border-radius: 9999px;">
                  Audit Trail
                </span>
                <span id="accAuditIcon" style="font-size: 0.9rem; color: var(--gold); transition: transform 0.2s;">▾</span>
              </div>
            </div>

            <div id="accAuditContent" style="padding: 1.25rem; display: none;">
              <div class="table-panel">
                <div class="table-panel-header" style="display: flex; align-items: center; justify-content: space-between;">
                  <span class="table-panel-title">Chronological Admin Action Trail</span>
                </div>
                <div class="table-wrap">
                  <table id="priceAuditTable">
                    <thead>
                      <tr>
                        <th>Date &amp; Timestamp</th>
                        <th>Admin User</th>
                        <th>Action</th>
                        <th>Previous Value</th>
                        <th>New Value</th>
                        <th>Net Delta</th>
                      </tr>
                    </thead>
                    <tbody id="priceAuditTbody">
                      <!-- Populated via JavaScript -->
                    </tbody>
                  </table>
                </div>
              </div>
            </div>
          </div>

          <!-- 6. DAILY PRICE LEDGER ACCORDION -->
          <div class="accordion-card" style="background: var(--elevated); border: 1px solid var(--rim); border-radius: var(--radius-lg); margin-bottom: 1.5rem; overflow: hidden;">
            <div class="accordion-header" onclick="toggleAccordion('accDailyContent', 'accDailyIcon')" style="padding: 1rem 1.25rem; display: flex; align-items: center; justify-content: space-between; cursor: pointer; user-select: none; background: rgba(255,255,255,0.015); border-bottom: 1px solid var(--rim);">
              <div style="display: flex; align-items: center; gap: 0.6rem;">
                <span style="font-size: 1.1rem;">📅</span>
                <h3 style="font-family: var(--font-display); font-size: 0.98rem; font-weight: 700; color: var(--ink); margin: 0;">
                  Daily Price Ledger
                </h3>
              </div>
              <div style="display: flex; align-items: center; gap: 0.6rem;">
                <span id="accDailyIcon" style="font-size: 0.9rem; color: var(--gold); transition: transform 0.2s;">▾</span>
              </div>
            </div>

            <div id="accDailyContent" style="padding: 1.25rem; display: none;">
              <div class="table-panel">
                <div class="table-panel-header" style="display: flex; align-items: center; justify-content: space-between;">
                  <span class="table-panel-title">Calendar-Grouped Price History</span>
                </div>
                <div class="table-wrap">
                  <table id="dailyPriceLedgerTable">
                    <thead>
                      <tr>
                        <th>Date</th>
                        <th>Region</th>
                        <th>Opening Price</th>
                        <th>Timeline Changes</th>
                        <th>Day Range</th>
                        <th>Closing Price</th>
                        <th>Movements</th>
                      </tr>
                    </thead>
                    <tbody id="dailyPriceLedgerTbody">
                      <!-- Populated via JavaScript -->
                    </tbody>
                  </table>
                </div>
              </div>
            </div>
          </div>

        </div>

        <!-- ══ TWO-STEP CONFIRMATION & PUBLISH MODAL ══ -->
        <div id="pricingConfirmModal" style="display: none; position: fixed; inset: 0; background: rgba(0, 0, 0, 0.85); backdrop-filter: blur(8px); z-index: 10000; align-items: center; justify-content: center; padding: 1.25rem;">
          <div style="background: var(--base); border: 1px solid var(--gold); border-radius: var(--radius-lg); max-width: 480px; width: 100%; padding: 1.5rem; box-shadow: 0 20px 50px rgba(0,0,0,0.8); animation: modalIn 0.2s ease-out;">
            <div style="font-size: 1.8rem; margin-bottom: 0.5rem;">🚀</div>
            <h3 style="font-family: var(--font-display); font-size: 1.25rem; font-weight: 700; color: var(--ink); margin-bottom: 0.3rem;">
              Confirm Price Update
            </h3>
            <p style="font-size: 0.78rem; color: var(--ink-dim); line-height: 1.5; margin-bottom: 1rem;">
              Push this new pricing tier live to student landing pages and checkout modals.
            </p>

            <!-- Summary Table of Pending Changes -->
            <div style="background: var(--elevated); border: 1px solid var(--rim); border-radius: var(--radius-md); padding: 0.85rem; margin-bottom: 1.25rem;">
              <div style="display: flex; justify-content: space-between; font-size: 0.75rem; margin-bottom: 0.4rem;">
                <span style="color: var(--ink-dim);">Region:</span>
                <strong style="color: var(--gold);" id="modalSummaryRegion">🇮🇳 India (INR ₹)</strong>
              </div>
              <div style="display: flex; justify-content: space-between; font-size: 0.75rem; margin-bottom: 0.4rem;">
                <span style="color: var(--ink-dim);">Sale Price:</span>
                <strong style="color: var(--emerald); font-family: var(--font-data);" id="modalSummarySale">₹1,499.00</strong>
              </div>
              <div style="display: flex; justify-content: space-between; font-size: 0.75rem; margin-bottom: 0.4rem;">
                <span style="color: var(--ink-dim);">Original Price:</span>
                <span style="color: var(--ink-muted); text-decoration: line-through; font-family: var(--font-data);" id="modalSummaryOrig">₹4,999.00</span>
              </div>
              <div style="display: flex; justify-content: space-between; font-size: 0.75rem; margin-bottom: 0.4rem;">
                <span style="color: var(--ink-dim);">Discount Badge:</span>
                <span class="badge badge-emerald" id="modalSummaryBadge">70% OFF</span>
              </div>
              <div style="display: flex; justify-content: space-between; font-size: 0.75rem;">
                <span style="color: var(--ink-dim);">Campaign:</span>
                <span style="color: var(--ink);" id="modalSummaryTag">Early Access Offer</span>
              </div>
            </div>

            <div style="display: flex; align-items: center; justify-content: flex-end; gap: 0.6rem;">
              <button type="button" onclick="closePublishConfirmModal()" class="btn-outline-gold" style="font-size: 0.8rem; padding: 0.5rem 1rem;">
                Cancel
              </button>
              <button type="button" id="btnConfirmPublishSubmit" onclick="executePublishPricingToCloud()" class="btn-gold" style="font-size: 0.8rem; font-weight: 700; padding: 0.5rem 1.25rem;">
                🔥 Confirm &amp; Push Live
              </button>
            </div>
          </div>
        </div>'''

# Extract old tab 4 + modal in admin.html
start_idx = content.find('<!-- ══ TAB 4: COUPONS & PRICING COMMAND CENTER ══ -->')
if start_idx == -1:
    start_idx = content.find('<!-- ══ TAB 4: PRICING & COUPONS COMMAND CENTER ══ -->')

end_idx = content.find('<!-- ══ TAB 5: SETTINGS ══ -->')

print("start_idx:", start_idx, "end_idx:", end_idx)

if start_idx != -1 and end_idx != -1:
    new_content = content[:start_idx] + clean_tab_pricing_html + '\n\n        ' + content[end_idx:]
    path.write_text(new_content, encoding='utf-8')
    print("SUCCESSFULLY_REPLACED_DESIGN")
else:
    print("INDEX_NOT_FOUND")

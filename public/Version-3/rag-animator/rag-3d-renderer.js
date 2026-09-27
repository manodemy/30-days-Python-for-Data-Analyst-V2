/**
 * rag-3d-renderer.js (v2.0 Cinematic Blender Diarama)
 * ---------------------------------------------------------------------------
 * Blender-Grade Isometric 3D Diorama for RAG Studio Theory Cinema.
 * Engineered for Luminous Light Studio theme (#f8fafc / #ffffff / #0f172a).
 * Features:
 *  - Sleek floating isometric architectural platform with soft contact shadows
 *  - Holographic sapphire neural core with orbiting golden/cyan synapse nodes
 *  - Recessed modern lab vault door with glowing LED frame & smooth hinge swing
 *  - Glowing 3D document tablets that levitate and orbit the core
 *  - 100% GSAP master timeline sync — ZERO clipping, zero obstructive light cones
 * ---------------------------------------------------------------------------
 */

(function (global) {
  'use strict';

  if (typeof THREE === 'undefined' || typeof gsap === 'undefined') {
    return;
  }

  var PALETTE = {
    canvasBg: 0xf8fafc,
    pedestalTop: 0xffffff,
    pedestalSide: 0xe2e8f0,
    wallMat: 0xf1f5f9,
    wallTrim: 0xc7d2fe,
    doorFrame: 0x334155,
    doorMetal: 0x1e293b,
    doorLockRed: 0xf43f5e,
    doorLockGreen: 0x10b981,
    coreIndigo: 0x4f46e5,
    coreSapphire: 0x3b82f6,
    coreGold: 0xf59e0b,
    coreFrozen: 0x06b6d4,
    coreEmerald: 0x10b981,
    docEmerald: 0x10b981,
    docCyan: 0x06b6d4,
    docIndigo: 0x6366f1,
    ambientLight: 0xffffff,
    keyLight: 0xffffff,
    rimLight: 0x818cf8,
    spotLight: 0x60a5fa
  };

  function Rag3DRenderer(containerEl, opts) {
    if (!containerEl) throw new Error('[Rag3DRenderer] containerEl is required.');
    opts = opts || {};

    this.container = containerEl;
    this.pixelRatioCap = opts.pixelRatioCap || 2;

    this._disposables = { geometries: [], materials: [], textures: [] };
    this._rafId = null;
    this._activeSceneTeardown = null;
    this._clock = new THREE.Clock();
    this._animators = []; // functions called on every render tick

    this._initRenderer();
    this._initSceneAndCamera();
    this._initLights();
    this._initResizeHandling();
    this._initVisibilityGuard();
  }

  // ── Core Setup ──
  Rag3DRenderer.prototype._initRenderer = function () {
    var width = this.container.clientWidth || 800;
    var height = this.container.clientHeight || 500;

    this.renderer = new THREE.WebGLRenderer({
      antialias: true,
      alpha: true,
      powerPreference: 'high-performance'
    });
    this.renderer.setClearColor(PALETTE.canvasBg, 1);
    this.renderer.setPixelRatio(Math.min(window.devicePixelRatio || 1, this.pixelRatioCap));
    this.renderer.setSize(width, height);
    this.renderer.shadowMap.enabled = true;
    this.renderer.shadowMap.type = THREE.PCFSoftShadowMap;
    this.renderer.toneMapping = THREE.ACESFilmicToneMapping;
    this.renderer.toneMappingExposure = 1.12;

    this.renderer.domElement.style.position = 'absolute';
    this.renderer.domElement.style.inset = '0';
    this.renderer.domElement.style.width = '100%';
    this.renderer.domElement.style.height = '100%';
    this.renderer.domElement.style.pointerEvents = 'none';
    this.container.appendChild(this.renderer.domElement);
  };

  Rag3DRenderer.prototype._initSceneAndCamera = function () {
    this.scene = new THREE.Scene();
    this.scene.background = new THREE.Color(PALETTE.canvasBg);

    var width = this.container.clientWidth || 800;
    var height = this.container.clientHeight || 500;

    // Isometric camera with comfortable framing
    this.camera = new THREE.PerspectiveCamera(34, width / height, 0.1, 100);
    this.camera.position.set(7.8, 6.2, 8.2);
    this._cameraTarget = new THREE.Vector3(0, 1.2, 0);
    this.camera.lookAt(this._cameraTarget);

    this.cameraRig = {
      x: this.camera.position.x,
      y: this.camera.position.y,
      z: this.camera.position.z,
      lookX: this._cameraTarget.x,
      lookY: this._cameraTarget.y,
      lookZ: this._cameraTarget.z
    };
  };

  Rag3DRenderer.prototype._initLights = function () {
    // 1. Soft Ambient Fill
    const ambient = new THREE.AmbientLight(PALETTE.ambientLight, 0.75);
    this.scene.add(ambient);

    // 2. Main Studio Key Light (soft directional sun with shadow)
    const keyLight = new THREE.DirectionalLight(PALETTE.keyLight, 1.15);
    keyLight.position.set(8, 14, 7);
    keyLight.castShadow = true;
    keyLight.shadow.mapSize.set(2048, 2048);
    keyLight.shadow.camera.near = 1;
    keyLight.shadow.camera.far = 30;
    keyLight.shadow.camera.left = -5;
    keyLight.shadow.camera.right = 5;
    keyLight.shadow.camera.top = 5;
    keyLight.shadow.camera.bottom = -5;
    keyLight.shadow.bias = -0.0004;
    this.scene.add(keyLight);

    // 3. Specular Rim Light (creates crisp edge highlights on bevels)
    const rimLight = new THREE.DirectionalLight(PALETTE.rimLight, 0.85);
    rimLight.position.set(-8, 7, -6);
    this.scene.add(rimLight);

    // 4. Subtle Volumetric Door Floor Pool (NO huge cone geometry!)
    this.doorFloorSpot = new THREE.SpotLight(0x38bdf8, 0, 14, Math.PI / 4, 0.5, 1.2);
    this.doorFloorSpot.position.set(-3.2, 3.5, -0.2);
    this.doorFloorSpot.target.position.set(0, 0.2, 0);
    this.scene.add(this.doorFloorSpot);
    this.scene.add(this.doorFloorSpot.target);

    // 5. Neural Brain Point Glow
    this.coreLight = new THREE.PointLight(PALETTE.coreIndigo, 1.5, 7, 2);
    this.coreLight.position.set(0, 1.7, 0);
    this.scene.add(this.coreLight);
  };

  Rag3DRenderer.prototype._initResizeHandling = function () {
    var self = this;
    if (typeof ResizeObserver !== 'undefined') {
      this._resizeObserver = new ResizeObserver(function () { self._onResize(); });
      this._resizeObserver.observe(this.container);
    } else {
      this._windowResizeHandler = function () { self._onResize(); };
      window.addEventListener('resize', this._windowResizeHandler);
    }
  };

  Rag3DRenderer.prototype._onResize = function () {
    var width = this.container.clientWidth || 800;
    var height = this.container.clientHeight || 500;
    this.camera.aspect = width / height;
    this.camera.updateProjectionMatrix();
    this.renderer.setSize(width, height);
  };

  Rag3DRenderer.prototype._initVisibilityGuard = function () {
    var self = this;
    this._visibilityHandler = function () {
      if (document.visibilityState === 'hidden') {
        self._stopRenderLoop();
      } else {
        self._startRenderLoop();
      }
    };
    document.addEventListener('visibilitychange', this._visibilityHandler);
  };

  Rag3DRenderer.prototype._startRenderLoop = function () {
    if (this._rafId !== null) return;
    var self = this;
    function tick() {
      self._rafId = requestAnimationFrame(tick);
      const delta = self._clock.getDelta();
      const time = self._clock.getElapsedTime();

      // Camera Rig update
      self.camera.position.set(self.cameraRig.x, self.cameraRig.y, self.cameraRig.z);
      self._cameraTarget.set(self.cameraRig.lookX, self.cameraRig.lookY, self.cameraRig.lookZ);
      self.camera.lookAt(self._cameraTarget);

      // Execute scene micro-animations
      self._animators.forEach(fn => fn(delta, time));

      self.renderer.render(self.scene, self.camera);
    }
    tick();
  };

  Rag3DRenderer.prototype._stopRenderLoop = function () {
    if (this._rafId !== null) {
      cancelAnimationFrame(this._rafId);
      this._rafId = null;
    }
  };

  Rag3DRenderer.prototype._track = function () {
    for (var i = 0; i < arguments.length; i++) {
      var item = arguments[i];
      if (!item) continue;
      if (item.isBufferGeometry) this._disposables.geometries.push(item);
      else if (item.isMaterial) this._disposables.materials.push(item);
      else if (item.isTexture) this._disposables.textures.push(item);
    }
    return arguments[0];
  };

  // ── Build Day 01 Slide 01: The Blender-Grade Diorama ──
  Rag3DRenderer.prototype.buildDay01Slide01Scene = function (masterTimeline) {
    if (this._activeSceneTeardown) {
      this.teardownActiveScene();
    }
    var self = this;
    var group = new THREE.Group();
    this.scene.add(group);
    this._animators = [];

    // ── 1. Floating Isometric Architectural Base Platform ──
    const platW = 7.4;
    const platD = 6.8;
    const platH = 0.4;
    const platGeo = new THREE.BoxGeometry(platW, platH, platD);
    const platMat = new THREE.MeshStandardMaterial({
      color: PALETTE.pedestalTop,
      roughness: 0.35,
      metalness: 0.1
    });
    this._track(platGeo, platMat);
    const platform = new THREE.Mesh(platGeo, platMat);
    platform.position.set(0, -platH / 2, 0);
    platform.receiveShadow = true;
    group.add(platform);

    // Floor Baseboard Bevel Trim
    const trimGeo = new THREE.BoxGeometry(platW + 0.1, 0.08, platD + 0.1);
    const trimMat = new THREE.MeshStandardMaterial({ color: 0xcbd5e1, metalness: 0.4, roughness: 0.3 });
    this._track(trimGeo, trimMat);
    const trim = new THREE.Mesh(trimGeo, trimMat);
    trim.position.set(0, -0.04, 0);
    group.add(trim);

    // Soft Contact Shadow under platform
    const shadowGeo = new THREE.PlaneGeometry(platW + 1.2, platD + 1.2);
    const shadowMat = new THREE.MeshBasicMaterial({
      color: 0x94a3b8,
      transparent: true,
      opacity: 0.22
    });
    this._track(shadowGeo, shadowMat);
    const contactShadow = new THREE.Mesh(shadowGeo, shadowMat);
    contactShadow.rotation.x = -Math.PI / 2;
    contactShadow.position.y = -platH - 0.02;
    group.add(contactShadow);

    // Modern Subtle Tech Floor Grid (clamped inside room interior)
    const grid = new THREE.GridHelper(5.6, 14, 0xa5b4fc, 0xe2e8f0);
    grid.position.set(0.4, 0.01, 0.4);
    group.add(grid);

    // ── 2. Unified Cutaway Room Walls (Seamless Corner, No Gaps!) ──
    const wallH = 3.6;
    const wallThick = 0.3;
    const wallMat = new THREE.MeshStandardMaterial({
      color: PALETTE.wallMat,
      roughness: 0.65,
      metalness: 0.05
    });
    this._track(null, wallMat);

    // Back Wall (extends full width)
    const backWallGeo = new THREE.BoxGeometry(platW, wallH, wallThick);
    this._track(backWallGeo);
    const backWall = new THREE.Mesh(backWallGeo, wallMat);
    backWall.position.set(0, wallH / 2, -platD / 2 + wallThick / 2);
    backWall.receiveShadow = true;
    backWall.castShadow = true;
    group.add(backWall);

    // Left Wall with Recessed Door Frame
    // Left Wall Back Section
    const leftBackW = 2.2;
    const leftBackGeo = new THREE.BoxGeometry(wallThick, wallH, leftBackW);
    this._track(leftBackGeo);
    const leftBack = new THREE.Mesh(leftBackGeo, wallMat);
    leftBack.position.set(-platW / 2 + wallThick / 2, wallH / 2, -platD / 2 + leftBackW / 2 + wallThick);
    leftBack.receiveShadow = true;
    leftBack.castShadow = true;
    group.add(leftBack);

    // Left Wall Front Section
    const leftFrontW = 2.2;
    const leftFrontGeo = new THREE.BoxGeometry(wallThick, wallH, leftFrontW);
    this._track(leftFrontGeo);
    const leftFront = new THREE.Mesh(leftFrontGeo, wallMat);
    leftFront.position.set(-platW / 2 + wallThick / 2, wallH / 2, platD / 2 - leftFrontW / 2);
    leftFront.receiveShadow = true;
    leftFront.castShadow = true;
    group.add(leftFront);

    // Doorway Header Lintel
    const lintelW = platD - leftBackW - leftFrontW - wallThick;
    const lintelGeo = new THREE.BoxGeometry(wallThick, 0.9, lintelW);
    this._track(lintelGeo);
    const lintel = new THREE.Mesh(lintelGeo, wallMat);
    lintel.position.set(-platW / 2 + wallThick / 2, wallH - 0.45, 0.05);
    lintel.receiveShadow = true;
    group.add(lintel);

    // Recessed Door Architrave Frame
    const archGeo = new THREE.BoxGeometry(0.38, 2.75, lintelW + 0.1);
    const archMat = new THREE.MeshStandardMaterial({ color: PALETTE.doorFrame, roughness: 0.35, metalness: 0.7 });
    this._track(archGeo, archMat);
    const archFrame = new THREE.Mesh(archGeo, archMat);
    archFrame.position.set(-platW / 2 + wallThick / 2, 1.35, 0.05);
    group.add(archFrame);

    // ── 3. The Modern Vault Door (Precision Hinge Pivot) ──
    const doorPivot = new THREE.Group();
    // Hinge sits on the back edge of the doorway opening
    doorPivot.position.set(-platW / 2 + wallThick / 2, 0, -lintelW / 2 + 0.05);
    group.add(doorPivot);

    const doorThickness = 0.16;
    const doorH = 2.65;
    const doorW = lintelW - 0.06;
    const doorGeo = new THREE.BoxGeometry(doorThickness, doorH, doorW);
    const doorMat = new THREE.MeshStandardMaterial({
      color: PALETTE.doorMetal,
      roughness: 0.28,
      metalness: 0.85
    });
    this._track(doorGeo, doorMat);
    const doorMesh = new THREE.Mesh(doorGeo, doorMat);
    // Offset center so rotation pivots strictly around the hinge edge
    doorMesh.position.set(0, doorH / 2, doorW / 2);
    doorMesh.castShadow = true;
    doorMesh.receiveShadow = true;
    doorPivot.add(doorMesh);

    // Digital Lock Status Bar
    const lockGeo = new THREE.CylinderGeometry(0.06, 0.06, 0.3, 16);
    lockGeo.rotateZ(Math.PI / 2);
    const lockMat = new THREE.MeshStandardMaterial({
      color: PALETTE.doorLockRed,
      emissive: new THREE.Color(PALETTE.doorLockRed),
      emissiveIntensity: 1.8
    });
    this._track(lockGeo, lockMat);
    const lockLight = new THREE.Mesh(lockGeo, lockMat);
    lockLight.position.set(doorThickness / 2 + 0.04, doorH / 2, doorW * 0.82);
    doorPivot.add(lockLight);

    // Sleek Titanium Handle Bar
    const handleGeo = new THREE.CylinderGeometry(0.025, 0.025, 0.8, 16);
    const handleMat = new THREE.MeshStandardMaterial({ color: 0x94a3b8, metalness: 0.95, roughness: 0.15 });
    this._track(handleGeo, handleMat);
    const handle = new THREE.Mesh(handleGeo, handleMat);
    handle.position.set(doorThickness / 2 + 0.06, doorH / 2, doorW * 0.72);
    doorPivot.add(handle);

    // ── 4. The 3D Neural Core (The Expert in the Room) ──
    const coreGroup = new THREE.Group();
    coreGroup.position.set(0.3, 1.7, 0.3);

    // High-tech Pedestal
    const pedGeo = new THREE.CylinderGeometry(0.65, 0.85, 0.5, 32);
    const pedMat = new THREE.MeshStandardMaterial({ color: 0x1e293b, roughness: 0.3, metalness: 0.8 });
    this._track(pedGeo, pedMat);
    const pedMesh = new THREE.Mesh(pedGeo, pedMat);
    pedMesh.position.y = -1.45;
    pedMesh.receiveShadow = true;
    coreGroup.add(pedMesh);

    // Concentric LED Ring on Pedestal
    const ledRingGeo = new THREE.TorusGeometry(0.66, 0.025, 12, 48);
    ledRingGeo.rotateX(Math.PI / 2);
    const ledRingMat = new THREE.MeshStandardMaterial({ color: 0x6366f1, emissive: 0x4f46e5, emissiveIntensity: 1.5 });
    this._track(ledRingGeo, ledRingMat);
    const ledRing = new THREE.Mesh(ledRingGeo, ledRingMat);
    ledRing.position.y = -1.2;
    coreGroup.add(ledRing);

    // Outer Geodesic Icosahedron Wireframe
    const outerGeo = new THREE.IcosahedronGeometry(1.05, 2);
    const outerMat = new THREE.MeshStandardMaterial({
      color: PALETTE.coreIndigo,
      wireframe: true,
      roughness: 0.2,
      metalness: 0.6
    });
    this._track(outerGeo, outerMat);
    const outerSphere = new THREE.Mesh(outerGeo, outerMat);
    coreGroup.add(outerSphere);

    // Inner Glowing Physical Sapphire Core
    const innerGeo = new THREE.SphereGeometry(0.68, 32, 32);
    const innerMat = new THREE.MeshPhysicalMaterial({
      color: PALETTE.coreSapphire,
      emissive: new THREE.Color(PALETTE.coreIndigo),
      emissiveIntensity: 0.65,
      roughness: 0.12,
      metalness: 0.85,
      transmission: 0.3,
      transparent: true,
      opacity: 0.92
    });
    this._track(innerGeo, innerMat);
    const innerSphere = new THREE.Mesh(innerGeo, innerMat);
    coreGroup.add(innerSphere);

    // Synapse Orbiting Torus Ring
    const torusGeo = new THREE.TorusGeometry(1.35, 0.02, 12, 64);
    torusGeo.rotateX(Math.PI / 3);
    const torusMat = new THREE.MeshStandardMaterial({ color: 0x38bdf8, emissive: 0x0284c7, emissiveIntensity: 0.8 });
    this._track(torusGeo, torusMat);
    const torusRing = new THREE.Mesh(torusGeo, torusMat);
    coreGroup.add(torusRing);

    // 80 Floating Orbiting Synapse Particles
    const pCount = 80;
    const pPos = new Float32Array(pCount * 3);
    for (let i = 0; i < pCount * 3; i += 3) {
      const u = Math.random();
      const v = Math.random();
      const theta = u * 2.0 * Math.PI;
      const phi = Math.acos(2.0 * v - 1.0);
      const r = 1.1 + Math.random() * 0.7;
      pPos[i] = r * Math.sin(phi) * Math.cos(theta);
      pPos[i + 1] = r * Math.sin(phi) * Math.sin(theta);
      pPos[i + 2] = r * Math.cos(phi);
    }
    const pGeo = new THREE.BufferGeometry();
    pGeo.setAttribute('position', new THREE.BufferAttribute(pPos, 3));
    const pMat = new THREE.PointsMaterial({
      color: 0x38bdf8,
      size: 0.055,
      transparent: true,
      opacity: 0.9,
      blending: THREE.AdditiveBlending,
      depthWrite: false
    });
    this._track(pGeo, pMat);
    const pPoints = new THREE.Points(pGeo, pMat);
    coreGroup.add(pPoints);

    group.add(coreGroup);

    // ── 5. 3D Floating Document Tablets (RAG Ingestion) ──
    const documents = [];
    const docThemes = [PALETTE.docEmerald, PALETTE.docCyan, PALETTE.docIndigo];
    for (let i = 0; i < 3; i++) {
      const dGeo = new THREE.BoxGeometry(0.7, 0.025, 0.95);
      const dMat = new THREE.MeshStandardMaterial({
        color: 0xffffff,
        emissive: new THREE.Color(docThemes[i]),
        emissiveIntensity: 0.45,
        roughness: 0.2,
        metalness: 0.3,
        transparent: true,
        opacity: 0
      });
      this._track(dGeo, dMat);
      const dMesh = new THREE.Mesh(dGeo, dMat);
      // Starts outside doorway, hidden
      dMesh.position.set(-4.5 - i * 0.5, 0.08, 0.05 + (i - 1) * 0.35);
      dMesh.castShadow = true;
      group.add(dMesh);
      documents.push(dMesh);
    }

    // ── Micro-Animations (60 FPS Rotation & Breathing) ──
    this._animators.push((delta, time) => {
      outerSphere.rotation.y += delta * 0.25;
      outerSphere.rotation.x += delta * 0.12;
      torusRing.rotation.z += delta * 0.4;
      pPoints.rotation.y += delta * 0.18;
      // Gentle core levitation breathing
      innerSphere.position.y = Math.sin(time * 2.0) * 0.04;

      documents.forEach((doc, idx) => {
        if (doc.material.opacity > 0.1) {
          doc.rotation.y += delta * 0.15;
          doc.position.y += Math.sin(time * 2.5 + idx * 1.5) * 0.0015;
        }
      });
    });

    // =====================================================================
    // GSAP Master Timeline Choreography — 100% Scrubber Synchronized
    // =====================================================================

    // Initial Camera Setup (Comfortable cinematic angle)
    this.cameraRig.x = 7.8;
    this.cameraRig.y = 6.2;
    this.cameraRig.z = 8.2;
    this.cameraRig.lookX = 0;
    this.cameraRig.lookY = 1.2;
    this.cameraRig.lookZ = 0;

    // ── 0.0s - 18.0s: Establishing Cinematic Orbital Drift ──
    masterTimeline.to(this.cameraRig, {
      x: 7.2, y: 5.8, z: 8.6,
      duration: 18.0,
      ease: 'none'
    }, 0.0);

    // ── 18.0s - 32.0s: Zoom smoothly to Expert locked in the room ──
    masterTimeline.to(this.cameraRig, {
      x: 5.6, y: 4.6, z: 6.8,
      lookX: 0.2, lookY: 1.5, lookZ: 0.1,
      duration: 12.0,
      ease: 'power2.inOut'
    }, 18.0);

    // ── 32.0s - 38.0s: Vault Door Slams Shut (Hinge Snap) ──
    // Door starts open a crack
    masterTimeline.set(doorPivot.rotation, { y: -0.7 }, 31.5);
    masterTimeline.to(doorPivot.rotation, {
      y: 0,
      duration: 0.45,
      ease: 'power4.in'
    }, 32.2);
    // Lock flashes red
    masterTimeline.to(lockMat.emissive, { r: 0.95, g: 0.12, b: 0.25, duration: 0.2 }, 32.6);

    // ── 38.0s - 48.0s: Parametric Memory "Impressive But Frozen" (Icy Blue Flash) ──
    masterTimeline.to(innerMat.color, { r: 0.06, g: 0.72, b: 0.85, duration: 3.0 }, 38.0)
      .to(innerMat, { emissiveIntensity: 1.2, duration: 2.0, yoyo: true, repeat: 1 }, 38.0)
      .to(self.coreLight, { intensity: 2.8, duration: 1.5, yoyo: true, repeat: 1 }, 38.0);

    // ── 48.0s - 82.0s: Three Incurable Flaws (Camera holds clean framing) ──
    masterTimeline.to(this.cameraRig, {
      x: 6.2, y: 5.2, z: 7.6,
      lookX: 0, lookY: 1.4, lookZ: 0,
      duration: 8.0,
      ease: 'power1.out'
    }, 48.0);

    // ── 82.0s - 92.0s: THE RAG BREAKTHROUGH! Vault Door Swings Open! ──
    // 1. Lock flashes emerald green
    masterTimeline.to(lockMat.emissive, { r: 0.06, g: 0.72, b: 0.5, duration: 0.3 }, 82.0);
    masterTimeline.to(lockMat.color, { r: 0.06, g: 0.72, b: 0.5, duration: 0.3 }, 82.0);

    // 2. Door swings open 105 degrees on its hinge
    masterTimeline.to(doorPivot.rotation, {
      y: -Math.PI / 1.7,
      duration: 2.0,
      ease: 'power3.out'
    }, 82.3);

    // 3. Volumetric Warm Sunlight beam washes across floor
    masterTimeline.to(self.doorFloorSpot, {
      intensity: 3.2,
      duration: 1.5,
      ease: 'power2.out'
    }, 82.6);

    // 4. Camera frames doorway & core in dynamic diagonal angle
    masterTimeline.to(this.cameraRig, {
      x: 5.2, y: 4.4, z: 6.6,
      lookX: 0, lookY: 1.4, lookZ: 0,
      duration: 3.5,
      ease: 'power2.inOut'
    }, 82.5);

    // 5. 3D Document Tablets slide through doorway to the core!
    documents.forEach((doc, idx) => {
      // Fade in at doorway
      masterTimeline.to(doc.material, { opacity: 0.95, duration: 0.4 }, 83.2 + idx * 0.35);
      // Glide smoothly to orbit around neural core
      masterTimeline.to(doc.position, {
        x: -0.6 + idx * 0.6,
        y: 1.0 + idx * 0.25,
        z: 0.1 + (idx - 1) * 0.45,
        duration: 2.5,
        ease: 'power2.out'
      }, 83.4 + idx * 0.35);
    });

    // ── 92.0s - 100.0s: Open-Book Exam & Grounded Generation ──
    // Documents orbit core, core turns bright emerald gold
    documents.forEach((doc, idx) => {
      masterTimeline.to(doc.position, {
        x: Math.cos(idx * 2.1) * 1.4 + 0.3,
        y: 1.7 + Math.sin(idx * 2.1) * 0.3,
        z: Math.sin(idx * 2.1) * 1.4 + 0.3,
        duration: 3.0,
        ease: 'power2.inOut'
      }, 92.0);
    });

    masterTimeline.to(innerMat.color, { r: 0.06, g: 0.82, b: 0.52, duration: 2.0 }, 92.5)
      .to(innerMat, { emissiveIntensity: 1.4, duration: 2.0 }, 92.5)
      .to(self.coreLight.color, { r: 0.06, g: 0.82, b: 0.52, duration: 2.0 }, 92.5);

    // ── 104.0s - 110.0s: Hero Cinematic Pullback ──
    masterTimeline.to(this.cameraRig, {
      x: 7.8, y: 6.2, z: 8.2,
      lookX: 0, lookY: 1.2, lookZ: 0,
      duration: 5.0,
      ease: 'power2.inOut'
    }, 104.0);

    // Teardown hook
    this._activeSceneTeardown = function () {
      self.scene.remove(group);
      self._animators = [];
      group.traverse(function (obj) {
        if (obj.geometry) obj.geometry = null;
        if (obj.material) obj.material = null;
      });
    };

    this._startRenderLoop();
    return {
      group: group,
      coreGroup: coreGroup,
      doorPivot: doorPivot,
      documents: documents
    };
  };

  Rag3DRenderer.prototype.teardownActiveScene = function () {
    if (this._activeSceneTeardown) {
      this._activeSceneTeardown();
      this._activeSceneTeardown = null;
    }
  };

  Rag3DRenderer.prototype.dispose = function () {
    this._stopRenderLoop();
    this.teardownActiveScene();

    this._disposables.geometries.forEach(function (g) { g.dispose(); });
    this._disposables.materials.forEach(function (m) { m.dispose(); });
    this._disposables.textures.forEach(function (t) { t.dispose(); });
    this._disposables = { geometries: [], materials: [], textures: [] };

    if (this._resizeObserver) {
      this._resizeObserver.disconnect();
      this._resizeObserver = null;
    }
    if (this._windowResizeHandler) {
      window.removeEventListener('resize', this._windowResizeHandler);
      this._windowResizeHandler = null;
    }
    if (this._visibilityHandler) {
      document.removeEventListener('visibilitychange', this._visibilityHandler);
      this._visibilityHandler = null;
    }

    this.renderer.dispose();
    if (this.renderer.domElement && this.renderer.domElement.parentNode) {
      this.renderer.domElement.parentNode.removeChild(this.renderer.domElement);
    }
  };

  global.Rag3DRenderer = Rag3DRenderer;
})(typeof window !== 'undefined' ? window : this);

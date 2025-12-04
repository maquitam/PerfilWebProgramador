<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Perfil Web Programador</title>

    <style>
        * { box-sizing: border-box; font-family: Arial, Helvetica, sans-serif; }
        body { margin: 0; background: #f3f4f6; }

        .page-wrapper {
            max-width: 1400px;   
            margin: 0 auto 40px;
            padding: 0 32px;
        }

        /* BANNER SUPERIOR */
        .banner {
            max-width: 1400px;
            margin: 16px auto 20px;
            width: 100%;
            min-height: 35vh;
            background: linear-gradient(135deg, #f97316, #facc15);
            color: white;
            border-radius: 40px;
            padding: 32px 64px 26px;
            display: flex;
            align-items: center;
            justify-content: center;
            box-shadow: 0 8px 24px rgba(0,0,0,0.22);
        }
        .banner-inner {
            max-width: 920px;
            text-align: center;
        }
        .banner-title {
            font-size: 30px;
            font-weight: 800;
            margin: 0 0 8px;
        }
        .banner-subtitle {
            font-size: 15px;
            margin: 0;
            opacity: 0.96;
        }

        /* TABS */
        .tabs-bar {
            max-width: 1400px;
            margin: 0 auto 16px;
            padding: 0 32px;
        }
        .tabs-container {
            background: #fff7ed;
            border-radius: 999px;
            padding: 4px;
            display: inline-flex;
            gap: 4px;
            border: 1px solid #fed7aa;
            box-shadow: 0 2px 6px rgba(0,0,0,0.06);
        }
        .tab-button {
            border: none;
            border-radius: 999px;
            padding: 6px 16px;
            font-size: 13px;
            cursor: pointer;
            background: transparent;
            color: #92400e;
            font-weight: 600;
        }
        .tab-button.active {
            background: #f97316;
            color: white;
        }

        /* CONTENIDOS DE TABS */
        .tab-content { display: none; }
        .tab-content.active { display: block; }

        /* LAYOUT PRINCIPAL (AGREGAR) */
        .main-layout {
            display: grid;
            grid-template-columns: 1.1fr 1.1fr;
            gap: 24px;
        }
        @media (max-width: 900px) {
            .main-layout {
                grid-template-columns: 1fr;
            }
        }

        /* TARJETAS */
        .card {
            background: #fffbeb;
            border-radius: 18px;
            padding: 18px 16px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.08);
            border: 1px solid #fbbf24;
        }
        .card h2 {
            margin-top: 0;
            font-size: 18px;
        }

        .form-group { margin-bottom: 12px; }
        .form-label {
            display: block;
            margin-bottom: 4px;
            font-size: 13px;
            font-weight: bold;
            color: #374151;
        }
        .form-input, .form-textarea {
            width: 100%;
            padding: 7px 8px;
            border-radius: 8px;
            border: 1px solid #d1d5db;
            font-size: 14px;
        }
        .form-textarea { min-height: 70px; resize: vertical; }

        .btn-primary, .btn-secondary, .btn-danger, .btn-small {
            border: none;
            border-radius: 999px;
            padding: 8px 16px;
            font-size: 13px;
            cursor: pointer;
            font-weight: 600;
        }
        .btn-primary {
            background: #f97316;
            color: white;
        }
        .btn-primary:hover { background: #ea580c; }
        .btn-secondary {
            background: white;
            border: 1px solid #e5e7eb;
            color: #374151;
        }
        .btn-secondary:hover { background: #f9fafb; }
        .btn-danger {
            background: #ef4444;
            color: white;
        }
        .btn-danger:hover { background: #dc2626; }
        .btn-small {
            padding: 4px 10px;
            font-size: 12px;
        }

        /* Botones del formulario */
        .form-actions {
            margin-top: 14px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 8px;
            flex-wrap: wrap;
        }
        .form-actions-left,
        .form-actions-right {
            display: flex;
            gap: 8px;
            flex-wrap: wrap;
        }

        /* MI PERFIL / PREVIEW */
        .profile-title {
            font-size: 18px;
            font-weight: 700;
            margin-bottom: 12px;
        }

        .profile-photo-placeholder {
            width: 220px;
            height: 220px;
            border-radius: 24px;
            border: 2px dashed #fbbf24;
            display: flex;
            align-items: center;
            justify-content: center;
            background: #fef3c7;
            color: #92400e;
            font-size: 14px;
            margin: 0 auto 18px;
            text-align: center;
        }

        .profile-grid {
            display: grid;
            grid-template-columns: 1fr;
            gap: 4px;
            font-size: 14px;
            color: #374151;
        }
        .profile-row-inline {
            display: flex;
            gap: 12px;
            flex-wrap: wrap;
        }
        .label-strong { font-weight: 600; }

        .section-title {
            margin-top: 10px;
            font-weight: 700;
            font-size: 14px;
        }
        .section-text {
            font-size: 14px;
            margin-top: 2px;
            white-space: pre-line;
        }

        .profile-actions-bottom {
            margin-top: 16px;
            display: flex;
            gap: 8px;
            justify-content: flex-start;
        }

        /* LISTAS DE PERFILES (VER / EDITAR) */
        .profiles-list {
            display: flex;
            flex-direction: column;
            gap: 12px;
        }
        .profiles-empty {
            font-size: 14px;
            color: #6b7280;
        }

        .profile-item {
            border-radius: 14px;
            padding: 10px 12px;
            background: #fefce8;
            border: 1px solid #facc15;
            display: flex;
            justify-content: space-between;
            align-items: center;
            font-size: 14px;
            gap: 12px;
        }
        .profile-item-main {
            display: flex;
            flex-direction: column;
        }
        .profile-item-name {
            font-weight: 700;
        }
        .profile-item-sub {
            font-size: 12px;
            color: #4b5563;
        }

        /* LISTADO VER PERFILES */
        .profile-list-item {
            display: flex;
            align-items: center;
            gap: 12px;
            padding: 10px 12px;
            border-radius: 14px;
            background: #fefce8;
            border: 1px solid #facc15;
        }
        .profile-list-photo {
            width: 70px;
            height: 70px;
            border-radius: 16px;
            border: 2px dashed #fbbf24;
            background: #fef3c7;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 11px;
            color: #92400e;
            text-align: center;
            flex-shrink: 0;
        }
        .profile-list-text {
            flex: 1;
        }
        .profile-list-name {
            font-weight: 700;
            margin-bottom: 2px;
        }
        .profile-list-meta {
            font-size: 13px;
            color: #4b5563;
            margin-bottom: 2px;
        }
        .profile-list-bio {
            font-size: 13px;
        }

        /* DETALLE PERFIL */
        .detalle-actions {
            margin-top: 16px;
            display: flex;
            justify-content: flex-end;
            gap: 8px;
        }
                
        /*Circulo de porcentaje de habilidad*/    
        .backcircle {
            r: 58px;
            cx: 68px;
            cy: 68px;
            stroke: #FEF3C7;
            stroke-width: 18px;
            fill: transparent;
        }
        .frontcircle {
            r: 58px;
            cx: 68px;
            cy: 68px;
            stroke: #FBBF24;
            stroke-width: 20px;
            stroke-linecap: round;
            fill: transparent;
            stroke-dasharray: 364.24px;
        }
        .textpercent {
            fill: #3C3A49; /*#BD6C2E*/
            font-size: 35px;
            font-weight: bold;
        }
        h2.habilities{
            color: #3C3A49;
        }
        .habilityname {
            text-anchor: middle;
            font-size: 24px;
            fill: #3C3A49;
            font-weight: bold;
        }
        svg {
            width: 136px;
            height: 119px;
            border: none;
            margin: 15px 15px 0px 0px;
        }
    </style>
</head>
<body>

<!-- BANNER SUPERIOR -->
<section class="banner">
    <div class="banner-inner">
        <p class="banner-title" id="bannerTitle"></p>
        <p class="banner-subtitle" id="bannerSubtitle"></p>
    </div>
</section>

<!-- TABS -->
<div class="tabs-bar">
    <div class="tabs-container">
        <button class="tab-button active" data-tab="agregar">Agregar perfil</button>
        <button class="tab-button" data-tab="editar">Editar perfiles</button>
        <button class="tab-button" data-tab="ver">Ver perfiles</button>
    </div>
</div>

<div class="page-wrapper">

    <!-- TAB AGREGAR -->
    <section id="tab-agregar" class="tab-content active">
        <div class="main-layout">
            <!-- FORMULARIO -->
            <div class="card">
                <h2>Formulario de datos personales</h2>

                <div class="form-group">
                    <label class="form-label">Nombres</label>
                    <input class="form-input" id="inputNombres" oninput="updatePreview()">
                </div>

                <div class="form-group">
                    <label class="form-label">Apellidos</label>
                    <input class="form-input" id="inputApellidos" oninput="updatePreview()">
                </div>

                <div class="form-group">
                    <label class="form-label">Edad</label>
                    <input type="number" class="form-input" id="inputEdad" oninput="updatePreview()">
                </div>

                <div class="form-group">
                    <label class="form-label">Teléfono</label>
                    <input class="form-input" id="inputTelefono" oninput="updatePreview()">
                </div>

                <div class="form-group">
                    <label class="form-label">Correo</label>
                    <input type="email" class="form-input" id="inputCorreo" oninput="updatePreview()">
                </div>

                <div class="form-group">
                    <label class="form-label">Ciudad de nacimiento</label>
                    <input class="form-input" id="inputCiudadNacimiento" oninput="updatePreview()">
                </div>

                <div class="form-group">
                    <label class="form-label">Ciudad de residencia</label>
                    <input class="form-input" id="inputCiudadResidencia" oninput="updatePreview()">
                </div>

                <div class="form-group">
                    <label class="form-label">Biografía</label>
                    <textarea class="form-textarea" id="inputBiografia" oninput="updatePreview()"></textarea>
                </div>

                <div class="form-group">
                    <label class="form-label">Experiencia</label>
                    <textarea class="form-textarea" id="inputExperiencia" oninput="updatePreview()"></textarea>
                </div>

                <div class="form-group">
                    <label class="form-label">Enlace GitHub</label>
                    <input class="form-input" id="inputGithub" oninput="updatePreview()">
                </div>

                <div class="form-group">
                    <label class="form-label">Enlace LinkedIn</label>
                    <input class="form-input" id="inputLinkedin" oninput="updatePreview()">
                </div>
                
                <div class="form-group">
                    <label class="form-label">Nombre Habilidad</label>
                    <input class="form-input" id="inputNombreHabilidad" placeholder="JAVA" oninput="updatePreview()">
                </div>
                
                <div class="form-group">
                    <label class="form-label">Porcentaje Habilidad</label>
                    <input type="number" min="0" max="100" placeholder="60" class="form-input" id="inputPorcentajeHabilidad" oninput="updatePreview()">
                </div>

                <div class="form-actions">
                    <!-- IZQUIERDA: Cargar foto + Habilidades -->
                    <div class="form-actions-left">
                        <button class="btn-secondary" type="button">Cargar foto</button>
                        <button class="btn-secondary" type="button" onclick="agregarHabilidades()">Habilidades</button>
                    </div>

                    <!-- DERECHA: Guardar + Eliminar -->
                    <div class="form-actions-right">
                        <button class="btn-primary" type="button" onclick="guardarPerfil()">Guardar cambios</button>
                        <button class="btn-danger" type="button" onclick="eliminarFormulario()">Eliminar</button>
                    </div>
                </div>
            </div>

            <div class="card">
                <div class="profile-title">Mi perfil (vista previa)</div>

                <div class="profile-photo-placeholder">
                    Foto de perfil
                </div>

                <div class="profile-grid">
                    <div>
                        <span class="label-strong">Nombre completo:</span>
                        <span id="previewNombreCompleto">—</span>
                    </div>

                    <div>
                        <span class="label-strong">Edad:</span>
                        <span id="previewEdad">—</span>
                    </div>

                    <div class="profile-row-inline">
                        <div>
                            <span class="label-strong">Teléfono:</span>
                            <span id="previewTelefono">—</span>
                        </div>
                        <div>
                            <span class="label-strong">Correo:</span>
                            <span id="previewCorreo">—</span>
                        </div>
                    </div>

                    <div class="profile-row-inline">
                        <div>
                            <span class="label-strong">Ciudad de nacimiento:</span>
                            <span id="previewCiudadNacimiento">—</span>
                        </div>
                        <div>
                            <span class="label-strong">Ciudad de residencia:</span>
                            <span id="previewCiudadResidencia">—</span>
                        </div>
                    </div>

                    <div class="section-title">Biografía</div>
                    <div class="section-text" id="previewBiografia">—</div>

                    <div class="section-title">Experiencia</div>
                    <div class="section-text" id="previewExperiencia">—</div>

                    <div class="section-title">Enlaces</div>
                    <div class="section-text" id="previewEnlaces">
                        GitHub: —  
                        LinkedIn: —
                    </div>

                    <div class="section-title">Habilidades</div>
                    <div> 
                        <svg viewBox="-17 -17 170 170" version="1.1" xmlns="http://www.w3.org/2000/svg" style="transform:rotate(-90deg)">
                            <text id="previewNombreHabilidad" class="habilityname" x="70" y="-3" style="transform:rotate(90deg) translate(0px, -145px)">—</text>
                            <circle class="backcircle"></circle>
                            <circle id="frontcircle" class="frontcircle" stroke-dashoffset="123px"></circle>
                            <text id="previewPorcentajeHabilidad" class="textpercent" x="35px" y="80px" style="transform:rotate(90deg) translate(0px, -138px)">—</text>
                        </svg>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- TAB EDITAR -->
    <section id="tab-editar" class="tab-content">
        <div class="card">
            <h2>Editar / eliminar perfiles</h2>
            <div id="editarListado" class="profiles-list"></div>
        </div>
    </section>

    <!-- TAB VER (LISTADO SIMPLE) -->
    <section id="tab-ver" class="tab-content">
        <div class="card">
            <h2>Perfiles registrados</h2>
            <div id="verListado" class="profiles-list"></div>
        </div>
    </section>

    <!-- TAB DETALLE (REVISAR PERFIL) -->
    <section id="tab-detalle" class="tab-content">
        <div class="card">
            <div class="profile-title" id="detalleNombreCompleto"></div>

            <div class="profile-photo-placeholder">
                Foto de perfil
            </div>

            <div class="profile-grid">
                <div>
                    <span class="label-strong">Edad:</span>
                    <span id="detalleEdad">—</span>
                </div>

                <div class="profile-row-inline">
                    <div>
                        <span class="label-strong">Teléfono:</span>
                        <span id="detalleTelefono">—</span>
                    </div>
                    <div>
                        <span class="label-strong">Correo:</span>
                        <span id="detalleCorreo">—</span>
                    </div>
                </div>

                <div class="profile-row-inline">
                    <div>
                        <span class="label-strong">Ciudad de nacimiento:</span>
                        <span id="detalleCiudadNacimiento">—</span>
                    </div>
                    <div>
                        <span class="label-strong">Ciudad de residencia:</span>
                        <span id="detalleCiudadResidencia">—</span>
                    </div>
                </div>

                <div class="section-title">Biografía</div>
                <div class="section-text" id="detalleBiografia">—</div>

                <div class="section-title">Experiencia</div>
                <div class="section-text" id="detalleExperiencia">—</div>

                <div class="section-title">Enlaces</div>
                <div class="section-text" id="detalleEnlaces">
                    GitHub: —  
                    LinkedIn: —
                </div>
            </div>

            <div class="detalle-actions">
                <button class="btn-secondary" onclick="volverListado()">Volver al listado</button>
                <button class="btn-primary" onclick="verHabilidades()">Ver habilidades</button>
            </div>
        </div>
    </section>

</div>

<script>
    /* ====== PERSISTENCIA EN LOCALSTORAGE ====== */
    const STORAGE_KEY = "perfilesPortafolio";

    let perfiles = [];
    let indiceEdicion = null;
    let indiceDetalle = null;

    function cargarPerfilesDesdeStorage() {
        const data = localStorage.getItem(STORAGE_KEY);
        if (data) {
            try {
                perfiles = JSON.parse(data);
            } catch (e) {
                console.error("Error al leer perfiles del storage", e);
                perfiles = [];
            }
        }
    }

    function guardarPerfilesEnStorage() {
        localStorage.setItem(STORAGE_KEY, JSON.stringify(perfiles));
    }

    // ====== BANNER ======
    function setBannerPortafolio() {
        document.getElementById("bannerTitle").textContent =
            "Bienvenid@ al portafolio de perfiles profesionales";
        document.getElementById("bannerSubtitle").textContent =
            "Aquí podrás encontrar datos personales, datos de contacto, experiencia y enlaces profesionales de diversas personas.";
    }

    function setBannerPerfil(nombres) {
        const soloNombres = (nombres || "").trim();
        const textoNombre = soloNombres ? soloNombres : "esta persona";
        document.getElementById("bannerTitle").textContent =
            "Bienvenid@ al perfil profesional de " + textoNombre;
        document.getElementById("bannerSubtitle").textContent = "";
    }

    // ====== FORMULARIO Y PREVIEW ======
    function leerFormulario() {
        return {
            nombres: document.getElementById("inputNombres").value.trim(),
            apellidos: document.getElementById("inputApellidos").value.trim(),
            edad: document.getElementById("inputEdad").value.trim(),
            telefono: document.getElementById("inputTelefono").value.trim(),
            correo: document.getElementById("inputCorreo").value.trim(),
            ciudadNacimiento: document.getElementById("inputCiudadNacimiento").value.trim(),
            ciudadResidencia: document.getElementById("inputCiudadResidencia").value.trim(),
            biografia: document.getElementById("inputBiografia").value.trim(),
            experiencia: document.getElementById("inputExperiencia").value.trim(),
            github: document.getElementById("inputGithub").value.trim(),
            linkedin: document.getElementById("inputLinkedin").value.trim(),
            nombreHabilidad: document.getElementById("inputNombreHabilidad").value.trim(),
            porcentajeHabilidad: document.getElementById("inputPorcentajeHabilidad").value.trim()
        };
    }

    function cargarFormulario(perfil) {
        document.getElementById("inputNombres").value = perfil.nombres || "";
        document.getElementById("inputApellidos").value = perfil.apellidos || "";
        document.getElementById("inputEdad").value = perfil.edad || "";
        document.getElementById("inputTelefono").value = perfil.telefono || "";
        document.getElementById("inputCorreo").value = perfil.correo || "";
        document.getElementById("inputCiudadNacimiento").value = perfil.ciudadNacimiento || "";
        document.getElementById("inputCiudadResidencia").value = perfil.ciudadResidencia || "";
        document.getElementById("inputBiografia").value = perfil.biografia || "";
        document.getElementById("inputExperiencia").value = perfil.experiencia || "";
        document.getElementById("inputGithub").value = perfil.github || "";
        document.getElementById("inputLinkedin").value = perfil.linkedin || "";
        document.getElementById("inputNombreHabilidad").value = perfil.nombreHabilidad || "";
        document.getElementById("inputPorcentajeHabilidad").value = perfil.porcentajeHabilidad|| "";
        updatePreview();
        indiceEdicion = null;
    }

    function limpiarFormulario() {
        cargarFormulario({
            nombres:"",apellidos:"",edad:"",telefono:"",correo:"",
            ciudadNacimiento:"",ciudadResidencia:"",
            biografia:"",experiencia:"",github:"",linkedin:""
        });
        indiceEdicion = null;
    }

    function updatePreview() {
        const p = leerFormulario();

        const nombreCompleto = (p.nombres || p.apellidos)
            ? (p.nombres + " " + p.apellidos).trim()
            : "—";

        document.getElementById("previewNombreCompleto").textContent = nombreCompleto;
        document.getElementById("previewEdad").textContent = p.edad || "—";
        document.getElementById("previewTelefono").textContent = p.telefono || "—";
        document.getElementById("previewCorreo").textContent = p.correo || "—";
        document.getElementById("previewCiudadNacimiento").textContent = p.ciudadNacimiento || "—";
        document.getElementById("previewCiudadResidencia").textContent = p.ciudadResidencia || "—";
        document.getElementById("previewBiografia").textContent = p.biografia || "—";
        document.getElementById("previewExperiencia").textContent = p.experiencia || "—";
        document.getElementById("previewNombreHabilidad").textContent = p.nombreHabilidad.toUpperCase() || "—";
        document.getElementById("previewPorcentajeHabilidad").textContent = p.porcentajeHabilidad + "%" || "—";
        document.getElementById("frontcircle").setAttribute("stroke-dashoffset",-(364 * p.porcentajeHabilidad / 100 - 364));

        const enlacesText =
            "GitHub: " + (p.github || "—") + "\n" +
            "LinkedIn: " + (p.linkedin || "—");
        document.getElementById("previewEnlaces").textContent = enlacesText;
    }

    function guardarPerfil() {
        const perfil = leerFormulario();

        if (!perfil.nombres && !perfil.apellidos) {
            alert("Por favor ingresa al menos los nombres o los apellidos.");
            return;
        }

        if (indiceEdicion === null) {
            perfiles.push(perfil);
        } else {
            perfiles[indiceEdicion] = perfil;
        }

        // Guardar en localStorage
        guardarPerfilesEnStorage();

        limpiarFormulario();
        renderEditarListado();
        renderVerListado();

        setBannerPortafolio();
        activarTab("ver");
    }

    function agregarHabilidades() {
        alert("Aquí podrás agregar y gestionar tus habilidades técnicas. (Función en construcción)");
    }

    function eliminarFormulario() {
        if (!confirm("¿Deseas borrar los datos del formulario?")) return;
        limpiarFormulario();
        setBannerPortafolio();
    }

    // ====== LISTAS EDITAR / VER ======
    function renderEditarListado() {
        const cont = document.getElementById("editarListado");
        cont.innerHTML = "";

        if (perfiles.length === 0) {
            cont.innerHTML = "<p class='profiles-empty'>Aún no hay perfiles registrados.</p>";
            return;
        }

        perfiles.forEach((p, idx) => {
            const div = document.createElement("div");
            div.className = "profile-item";

            const main = document.createElement("div");
            main.className = "profile-item-main";
            const nombre = (p.nombres + " " + p.apellidos).trim() || "(Sin nombre)";

            main.innerHTML =
                "<span class='profile-item-name'>" + nombre + "</span>" +
                "<span class='profile-item-sub'>Edad: " + (p.edad || "—") +
                " · Teléfono: " + (p.telefono || "—") + "</span>";

            const actions = document.createElement("div");
            actions.style.display = "flex";
            actions.style.gap = "6px";

            const btnEdit = document.createElement("button");
            btnEdit.className = "btn-secondary btn-small";
            btnEdit.textContent = "Editar";
            btnEdit.onclick = () => {
                indiceEdicion = idx;
                cargarFormulario(perfiles[idx]);
                setBannerPortafolio();
                activarTab("agregar");
            };

            const btnDel = document.createElement("button");
            btnDel.className = "btn-danger btn-small";
            btnDel.textContent = "Eliminar";
            btnDel.onclick = () => {
                if (!confirm("¿Eliminar este perfil?")) return;
                perfiles.splice(idx, 1);

                // Guardar cambios en localStorage
                guardarPerfilesEnStorage();

                renderEditarListado();
                renderVerListado();
                if (perfiles.length === 0) {
                    setBannerPortafolio();
                }
            };

            actions.appendChild(btnEdit);
            actions.appendChild(btnDel);

            div.appendChild(main);
            div.appendChild(actions);

            cont.appendChild(div);
        });
    }

    function renderVerListado() {
        const cont = document.getElementById("verListado");
        cont.innerHTML = "";

        if (perfiles.length === 0) {
            cont.innerHTML = "<p class='profiles-empty'>Aún no hay perfiles registrados.</p>";
            return;
        }

        perfiles.forEach((p, idx) => {
            const item = document.createElement("div");
            item.className = "profile-list-item";

            const foto = document.createElement("div");
            foto.className = "profile-list-photo";
            foto.textContent = "Foto";

            const text = document.createElement("div");
            text.className = "profile-list-text";

            const nombre = (p.nombres + " " + p.apellidos).trim() || "(Sin nombre)";
            const edad = p.edad || "—";
            const bio = p.biografia || "Sin biografía registrada.";

            text.innerHTML =
                "<div class='profile-list-name'>" + nombre + "</div>" +
                "<div class='profile-list-meta'>Edad: " + edad + "</div>" +
                "<div class='profile-list-bio'>" + bio + "</div>";

            const actions = document.createElement("div");
            const btnVer = document.createElement("button");
            btnVer.className = "btn-primary btn-small";
            btnVer.textContent = "Revisar perfil";
            btnVer.onclick = () => revisarPerfil(idx);
            actions.appendChild(btnVer);

            item.appendChild(foto);
            item.appendChild(text);
            item.appendChild(actions);

            cont.appendChild(item);
        });
    }

    // ====== DETALLE PERFIL ======
    function revisarPerfil(idx) {
        const p = perfiles[idx];
        if (!p) return;
        indiceDetalle = idx;

        const nombreCompleto = (p.nombres + " " + p.apellidos).trim() || "(Sin nombre)";

        document.getElementById("detalleNombreCompleto").textContent = nombreCompleto;
        document.getElementById("detalleEdad").textContent = p.edad || "—";
        document.getElementById("detalleTelefono").textContent = p.telefono || "—";
        document.getElementById("detalleCorreo").textContent = p.correo || "—";
        document.getElementById("detalleCiudadNacimiento").textContent = p.ciudadNacimiento || "—";
        document.getElementById("detalleCiudadResidencia").textContent = p.ciudadResidencia || "—";
        document.getElementById("detalleBiografia").textContent = p.biografia || "—";
        document.getElementById("detalleExperiencia").textContent = p.experiencia || "—";

        const enlacesText =
            "GitHub: " + (p.github || "—") + "\n" +
            "LinkedIn: " + (p.linkedin || "—");
        document.getElementById("detalleEnlaces").textContent = enlacesText;

        setBannerPerfil(p.nombres);
        activarTab("detalle");
    }

    function volverListado() {
        setBannerPortafolio();
        activarTab("ver");
    }

    function verHabilidades() {
        alert("Aquí podrías mostrar el portafolio de habilidades de la persona. (Función pendiente)");
    }

    // ====== TABS ======
    function activarTab(nombre) {
        document.querySelectorAll(".tab-button").forEach(btn => {
            btn.classList.toggle("active", btn.dataset.tab === nombre);
        });

        document.querySelectorAll(".tab-content").forEach(sec => {
            sec.classList.toggle("active", sec.id === "tab-" + nombre);
        });
    }

    document.querySelectorAll(".tab-button").forEach(btn => {
        btn.addEventListener("click", () => {
            activarTab(btn.dataset.tab);
            setBannerPortafolio();
        });
    });

    // ====== ESTADO INICIAL ======
    cargarPerfilesDesdeStorage();
    setBannerPortafolio();
    limpiarFormulario();
    renderEditarListado();
    renderVerListado();
</script>

</body>
</html>

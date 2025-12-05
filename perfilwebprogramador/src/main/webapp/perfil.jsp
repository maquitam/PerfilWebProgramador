<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String bannerTitulo = (String) request.getAttribute("bannerTitulo");
    String bannerSubtitulo = (String) request.getAttribute("bannerSubtitulo");
    String fotoRuta = (String) request.getAttribute("fotoRuta");

    String bannerTituloMostrar = (bannerTitulo != null)
            ? bannerTitulo
            : "Bienvenid@ al portafolio de perfiles profesionales";

    String bannerSubtituloMostrar = (bannerSubtitulo != null)
            ? bannerSubtitulo
            : "Aquí podrás encontrar datos personales, datos de contacto, experiencia y enlaces profesionales de diversas personas.";

    String fotoUrl = "";
    if (fotoRuta != null && !fotoRuta.isEmpty()) {
        fotoUrl = request.getContextPath() + "/" + fotoRuta;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Portafolio de perfiles</title>
    <style>
        body {
            margin: 0;
            font-family: system-ui, -apple-system, BlinkMacSystemFont, "Segoe UI", sans-serif;
            background: #f3f4f6;
        }

        .page-container {
            max-width: 1200px;
            margin: 24px auto 40px;
            padding: 0 16px 24px;
        }

        .banner {
            max-width: 1400px;
            margin: 0 auto 20px;
            width: 100%;
            min-height: 16vh;
            background: linear-gradient(135deg, #f97316, #facc15);
            color: white;
            border-radius: 40px;
            padding: 24px 40px 24px;
            box-shadow: 0 8px 24px rgba(0,0,0,0.22);
            position: relative;

            display: flex;
            justify-content: center;
        }

        .banner-inner {
            max-width: 1100px;
            width: 100%;
            margin: 0 auto;
        }

        .banner-header {
            text-align: center;
            margin-bottom: 12px;
        }

        .banner-title {
            font-size: 32px;
            font-weight: 800;
            margin-bottom: 4px;
        }

        .banner-subtitle {
            font-size: 14px;
            margin: 0;
            opacity: 0.9;
        }

        .banner-edit-toggle {
            position: absolute;
            top: 16px;
            left: 24px;
        }

        .btn-toggle {
            border: none;
            border-radius: 999px;
            padding: 6px 14px;
            font-size: 12px;
            cursor: pointer;
            background: #fef3c7;
            color: #78350f;
            font-weight: 600;
            box-shadow: 0 2px 6px rgba(0,0,0,0.18);
        }

        .banner-edit-panel {
            display: none;
            margin-top: 16px;
            width: 100%;
        }

        .banner-edit-panel.open {
            display: block;
        }

        .banner-edit-toolbar {
            display: flex;
            justify-content: flex-end;
            margin-bottom: 6px;
        }

        .btn-small {
            font-size: 12px;
            padding: 4px 10px;
            border-radius: 999px;
            border: none;
            cursor: pointer;
        }
        button.btn-soft.btn-small:hover{
            border-bottom: 2px solid #7f1d1d;
            background: #f3dadaf0;
        }

        .btn-secondary {
            background: #fef3c7;
            color: #92400e;
            border: none;
            border-radius: 12px;
            cursor: pointer;
        }
        .btn-secondary:hover{
            background: #F2E7BE;
            border-bottom: 2px solid #92400e;
        }

        .btn-primary {
            background: #f97316;
            color: white;
            border: none;
            border-radius: 999px;
            padding: 6px 14px;
            font-size: 13px;
            cursor: pointer;
        }
        .btn-primary:hover{
            background: #ef690c;
        }

        .banner-edit-columns {
            display: flex;
            gap: 16px;
            width: 100%;
        }

        .banner-edit-col {
            flex: 0 0 50%;
            max-width: 50%;
        }

        .mini-banner {
            background: rgba(255,255,255,0.25);
            border-radius: 24px;
            padding: 16px 18px;
            text-align: left;
        }

        .mini-banner-title {
            font-weight: 700;
            font-size: 18px;
            margin-bottom: 4px;
        }

        .mini-banner-subtitle {
            font-size: 12px;
        }

        .banner-edit-label {
            font-size: 12px;
            font-weight: 600;
            margin-bottom: 4px;
            display: block;
        }

        .banner-edit-input {
            width: 100%;
            border-radius: 999px;
            border: none;
            padding: 8px 14px;
            font-size: 13px;
            margin-bottom: 8px;
        }

        /* Tabs generales */
        .tabs {
            display: flex;
            gap: 8px;
            margin-bottom: 12px;
        }

        .tab-button {
            border-radius: 999px;
            border: 1px solid #fed7aa;
            background: #fff7ed;
            padding: 6px 14px;
            font-size: 13px;
            cursor: pointer;
        }

        .tab-button.active {
            background: #f97316;
            color: white;
            border-color: #f97316;
        }

        .tab-content {
            display: none;
        }

        .tab-content.active {
            display: block;
        }

        .card {
            background: #fffbeb;
            border-radius: 26px;
            border: 1px solid #fed7aa;
            padding: 18px 18px 20px;
            box-shadow: 0 4px 14px rgba(0,0,0,0.08);
        }

        .card h2 {
            margin-top: 0;
            margin-bottom: 12px;
        }

        .main-layout {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 20px;
        }

        @media (max-width: 900px) {
            .main-layout {
                grid-template-columns: 1fr;
            }
        }

        .form-group {
            margin-bottom: 8px;
        }

        .form-label {
            display: block;
            font-size: 12px;
            font-weight: 600;
            margin-bottom: 3px;
        }

        .form-input,
        .form-textarea {
            width: 100%;
            border-radius: 999px;
            border: 1px solid #fed7aa;
            padding: 8px 12px;
            font-size: 13px;
            box-sizing: border-box;
        }

        .form-textarea {
            border-radius: 16px;
            min-height: 60px;
            resize: vertical;
        }

        .form-actions {
            margin-top: 10px;
            display: flex;
            gap: 8px;
            flex-wrap: wrap;
        }

        .btn-danger {
            background: #f97373;
            color: white;
            border: none;
            border-radius: 999px;
            padding: 6px 14px;
            font-size: 13px;
            cursor: pointer;
        }
        .btn-danger:hover{
            background: #f16363;
        }

        .btn-soft {
            background: #fee2e2;
            color: #7f1d1d;
            border: none;
            padding: 6px 12px;
            border-radius: 999px;
            cursor: pointer;
        }

        /* Vista previa rápida */
        .preview-title {
            font-weight: 700;
            margin-bottom: 6px;
        }

        .preview-photo-wrapper {
            width: 160px;
            height: 160px;
            border-radius: 24px;
            border: 2px dashed #fed7aa;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-bottom: 8px;
            overflow: hidden;
            background: rgba(255,255,255,0.7);
        }

        .preview-photo-wrapper img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            display: none;
        }

        .preview-photo-placeholder {
            font-size: 12px;
            color: #b45309;
            display: flex;
            align-items: center;
            justify-content: center;
            width: 100%;
            height: 100%;
        }

        .preview-text {
            font-size: 15px;
            margin: 5px 0;
            line-height: 1.5;
        }

        .label-strong {
            font-weight: 700;
        }

        /* Listados */
        .profiles-list {
            display: flex;
            flex-direction: column;
            gap: 6px;
        }

        .profile-list-item {
            background: #fff7ed;
            border-radius: 18px;
            padding: 10px 12px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .profile-list-main {
            display: flex;
            gap: 10px;
            align-items: center;
        }

        .profile-list-photo-mini {
            width: 44px;
            height: 44px;
            border-radius: 16px;
            background: #fed7aa;
            display: flex;
            align-items: center;
            justify-content: center;
            overflow: hidden;
            font-size: 12px;
            color: #7c2d12;
        }

        .profile-list-photo-mini img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .profile-list-text {
            font-size: 13px;
        }

        .profile-list-name {
            font-weight: 700;
        }

        .profile-list-meta {
            font-size: 12px;
            color: #4b5563;
        }

        .profile-list-bio {
            font-size: 12px;
            color: #6b7280;
        }

        .profile-list-actions {
            display: flex;
            gap: 6px;
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
<div class="page-container">

    <!-- BANNER -->
    <div class="banner">
        <div class="banner-inner">
            <div class="banner-edit-toggle">
                <button type="button" id="toggleBannerEdit" class="btn-toggle">Modo edición</button>
            </div>

            <div class="banner-header">
                <div id="bannerTitle" class="banner-title"><%= bannerTituloMostrar %></div>
                <p id="bannerSubtitle" class="banner-subtitle"><%= bannerSubtituloMostrar %></p>
            </div>

            <div class="banner-edit-panel" id="bannerEditPanel">
                <div class="banner-edit-toolbar">
                    <button type="button" id="closeBannerEdit" class="btn-small btn-secondary">Cerrar edición</button>
                </div>

                <div class="banner-edit-columns">
                    <!-- Vista previa mini -->
                    <div class="banner-edit-col">
                        <div class="mini-banner">
                            <div id="miniBannerTitle" class="mini-banner-title"><%= bannerTituloMostrar %></div>
                            <div id="miniBannerSubtitle" class="mini-banner-subtitle"><%= bannerSubtituloMostrar %></div>
                        </div>
                    </div>

                    <!-- Formulario edición banner -->
                    <div class="banner-edit-col">
                        <form method="post"
                              action="<%=request.getContextPath()%>/config-banner"
                              enctype="multipart/form-data">
                            <label class="banner-edit-label" for="inputBannerTitulo">Título del banner</label>
                            <input id="inputBannerTitulo"
                                   name="bannerTitulo"
                                   class="banner-edit-input"
                                   value="<%= (bannerTitulo != null ? bannerTitulo : "") %>">

                            <label class="banner-edit-label" for="inputBannerSubtitulo">Subtítulo</label>
                            <input id="inputBannerSubtitulo"
                                   name="bannerSubtitulo"
                                   class="banner-edit-input"
                                   value="<%= (bannerSubtitulo != null ? bannerSubtitulo : "") %>">

                            <button type="submit" class="btn-primary btn-small">Guardar banner</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- CONTENIDO PRINCIPAL -->
    <div class="card">
        <div class="tabs">
            <button type="button" class="tab-button active" data-tab="agregar">Agregar perfil</button>
            <button type="button" class="tab-button" data-tab="editar">Editar perfiles</button>
            <button type="button" class="tab-button" data-tab="ver">Ver perfiles</button>
        </div>

        <!-- TAB AGREGAR -->
        <section id="tab-agregar" class="tab-content active">
            <div class="main-layout">
                <!-- Formulario -->
                <div>
                    <h2>Agregar o actualizar perfil</h2>
                    <p style="font-size:13px; margin-top:-4px; margin-bottom:8px;">Mi perfil (formulario)</p>

                    <input type="hidden" id="indiceEdicion" value="-1">

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
                        <input class="form-input" id="inputEdad" oninput="updatePreview()">
                    </div>
                    <div class="form-group">
                        <label class="form-label">Teléfono</label>
                        <input class="form-input" id="inputTelefono" oninput="updatePreview()">
                    </div>
                    <div class="form-group">
                        <label class="form-label">Correo electrónico</label>
                        <input class="form-input" id="inputCorreo" oninput="updatePreview()">
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
                        <label class="form-label">Ocupación / Rol</label>
                        <input class="form-input" id="inputOcupacion" oninput="updatePreview()">
                    </div>
                    <div class="form-group">
                        <label class="form-label">GitHub</label>
                        <input class="form-input" id="inputGithub" oninput="updatePreview()">
                    </div>
                    <div class="form-group">
                        <label class="form-label">LinkedIn</label>
                        <input class="form-input" id="inputLinkedin" oninput="updatePreview()">
                    </div>
                    <div class="form-group">
                        <label class="form-label">Biografía</label>
                        <textarea class="form-textarea" id="inputBiografia" oninput="updatePreview()"></textarea>
                    </div>
                    <div class="form-group">
                        <label class="form-label">Experiencia</label>
                        <textarea class="form-textarea" id="inputExperiencia" oninput="updatePreview()"></textarea>
                    </div>
                    <div id="nuevaHabilidad">
                        <div class="form-group">
                            <label class="form-label">Nombre Habilidad</label>
                            <input class="form-input" id="inputNombreHabilidad" placeholder="JAVA" oninput="updatePreview()">
                        </div>
                
                        <div class="form-group">
                            <label class="form-label">Porcentaje Habilidad</label>
                            <input type="number" min="0" max="100" placeholder="60" class="form-input" id="inputPorcentajeHabilidad" oninput="updatePreview()">
                        </div>
                    </div>
                    <div id="nuevaHabilidadForm"></div>

                    <div class="form-actions">
                        <button type="button" class="btn-secondary" id="btnCargarFoto">Cargar foto</button>
                        <button class="btn-secondary" type="button" onclick="agregarHabilidades()">Nueva Habilidad</button>
                        <button class="btn-secondary" type="button" onclick="eliminarHabilidades()">Eliminar Habilidad</button>
                        <button type="button" class="btn-primary" onclick="guardarPerfil()">Guardar cambios</button>
                        <button type="button" class="btn-danger" onclick="eliminarFormulario()">Eliminar</button>
                    </div>

                    <!-- input de archivo solo para la foto -->
                    <input type="file" id="inputFotoPerfil" accept="image/*" style="display:none;">
                </div>

                <!-- Vista previa rápida -->
                <div>
                    <h2>Vista previa rápida</h2>

                    <div class="preview-photo-wrapper">
                        <% if (fotoUrl != null && !fotoUrl.isEmpty()) { %>
                            <img id="previewPhotoImg" src="<%= fotoUrl %>" alt="Foto de perfil" style="display:block;">
                            <div id="previewPhotoText" class="preview-photo-placeholder" style="display:none;">Foto de perfil</div>
                        <% } else { %>
                            <img id="previewPhotoImg" src="" alt="Foto de perfil">
                            <div id="previewPhotoText" class="preview-photo-placeholder">Foto de perfil</div>
                        <% } %>
                    </div>

                    <p class="preview-text"><span class="label-strong">Nombre:</span> <span id="previewNombre">—</span></p>
                    <p class="preview-text"><span class="label-strong">Edad:</span> <span id="previewEdad">—</span></p>
                    <p class="preview-text"><span class="label-strong">Teléfono:</span> <span id="previewTelefono">—</span></p>
                    <p class="preview-text"><span class="label-strong">Correo:</span> <span id="previewCorreo">—</span></p>
                    <p class="preview-text"><span class="label-strong">Ciudad de residencia:</span> <span id="previewCiudadResidencia">—</span></p>
                    <p class="preview-text"><span class="label-strong">Ocupación:</span> <span id="previewOcupacion">—</span></p>
                    <p class="preview-text"><span class="label-strong">Biografía:</span> <span id="previewBiografia">—</span></p>
                    <p class="preview-text"><span class="label-strong">Experiencia:</span> <span id="previewExperiencia">—</span></p>
                    <div class="label-strong">Habilidades</div>
                    <div> 
                        <svg id="progressHabilidad" viewBox="-17 -17 170 170" version="1.1" xmlns="http://www.w3.org/2000/svg" style="transform:rotate(-90deg)">
                            <text id="previewNombreHabilidad" class="habilityname" x="70" y="-3" style="transform:rotate(90deg) translate(0px, -145px)">—</text>
                            <circle class="backcircle"></circle>
                            <circle id="frontcircle" class="frontcircle" stroke-dashoffset="-364px"></circle>
                            <text id="previewPorcentajeHabilidad" class="textpercent" x="35px" y="80px" style="transform:rotate(90deg) translate(0px, -138px)">—</text>
                        </svg>
                        <span id="nuevaHabilidadPreview"></span>
                    </div>
                </div>
            </div>
        </section>

        <!-- TAB EDITAR -->
        <section id="tab-editar" class="tab-content">
            <h2>Editar perfiles</h2>
            <div id="editarListado" class="profiles-list"></div>
        </section>

        <!-- TAB VER -->
        <section id="tab-ver" class="tab-content">
            <h2>Perfiles registrados</h2>
            <div id="verListado" class="profiles-list"></div>
            <div id="detalleVerPerfil" style="margin-top:16px; display:none;"></div>
        </section>
    </div>
</div>

<script>
    // ==========================
    // VARIABLES GLOBALES
    // ==========================
    const STORAGE_KEY = "perfilesPortafolio";
    let perfiles = [];
    let indiceEdicion = -1;
    let fotoGlobalUrl = "<%= (fotoUrl != null ? fotoUrl : "") %>";
    let contador = 0;
    // ==========================
    // STORAGE
    // ==========================
    function cargarPerfilesDesdeStorage() {
        const data = localStorage.getItem(STORAGE_KEY);
        if (!data) {
            perfiles = [];
            return;
        }
        try {
            perfiles = JSON.parse(data) || [];
        } catch (e) {
            console.error("Error leyendo perfiles de localStorage", e);
            perfiles = [];
        }
    }

    function guardarPerfilesEnStorage() {
        localStorage.setItem(STORAGE_KEY, JSON.stringify(perfiles));
    }

    // ==========================
    // BANNER
    // ==========================
    function setBannerPortafolio() {
        const titulo = document.getElementById("bannerTitle");
        const sub = document.getElementById("bannerSubtitle");
        if (!titulo || !sub) return;
        if (!titulo.textContent || titulo.textContent.trim().length === 0) {
            titulo.textContent = "Bienvenid@ al portafolio de perfiles profesionales";
        }
    }

    function syncMiniBannerPreview() {
        const inputTitulo = document.getElementById("inputBannerTitulo");
        const inputSub = document.getElementById("inputBannerSubtitulo");
        const miniTitulo = document.getElementById("miniBannerTitle");
        const miniSub = document.getElementById("miniBannerSubtitle");
        const bannerTitulo = document.getElementById("bannerTitle");
        const bannerSub = document.getElementById("bannerSubtitle");

        if (!inputTitulo || !miniTitulo || !bannerTitulo) return;

        const t = (inputTitulo.value || "").trim() ||
            "Bienvenid@ al portafolio de perfiles profesionales";
        const s = (inputSub ? inputSub.value.trim() : "");

        miniTitulo.textContent = t;
        if (miniSub) miniSub.textContent = s;
        bannerTitulo.textContent = t;
        if (bannerSub) bannerSub.textContent = s;
    }

    // ==========================
    // FORMULARIO PERFIL
    // ==========================
    function leerFormulario() {
        const habilidades = [];
        for (let i = 0; i < contador; i++) {
            const nombre = document.getElementById("inputNombreHabilidad_" + i)?.value.trim() || "";
            const porcentaje = document.getElementById("inputPorcentajeHabilidad_" + i)?.value.trim() || "";
            habilidades.push({
                nombre: nombre,
                porcentaje: porcentaje
                
            });
        }
        return {
            habilidades,
            nombres: document.getElementById("inputNombres").value.trim(),
            apellidos: document.getElementById("inputApellidos").value.trim(),
            edad: document.getElementById("inputEdad").value.trim(),
            telefono: document.getElementById("inputTelefono").value.trim(),
            correo: document.getElementById("inputCorreo").value.trim(),
            ciudadNacimiento: document.getElementById("inputCiudadNacimiento").value.trim(),
            ciudadResidencia: document.getElementById("inputCiudadResidencia").value.trim(),
            ocupacion: document.getElementById("inputOcupacion").value.trim(),
            github: document.getElementById("inputGithub").value.trim(),
            linkedin: document.getElementById("inputLinkedin").value.trim(),
            biografia: document.getElementById("inputBiografia").value.trim(),
            experiencia: document.getElementById("inputExperiencia").value.trim(),
            nombreHabilidad: document.getElementById("inputNombreHabilidad").value.trim(),
            porcentajeHabilidad: document.getElementById("inputPorcentajeHabilidad").value.trim(),
            fotoUrl: fotoGlobalUrl || ""
            
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
        document.getElementById("inputOcupacion").value = perfil.ocupacion || "";
        document.getElementById("inputGithub").value = perfil.github || "";
        document.getElementById("inputLinkedin").value = perfil.linkedin || "";
        document.getElementById("inputBiografia").value = perfil.biografia || "";
        document.getElementById("inputExperiencia").value = perfil.experiencia || "";
        document.getElementById("inputNombreHabilidad").value = perfil.nombreHabilidad || "";
        document.getElementById("inputPorcentajeHabilidad").value = perfil.porcentajeHabilidad|| "";
              
        if(perfil.habilidades.length > 0){
            for (let z = 0 ; z < perfil.habilidades.length; z++) {
            document.getElementById("inputNombreHabilidad_" + z).value = perfil.habilidades[z].nombre|| "";
            document.getElementById("inputPorcentajeHabilidad_" + z).value = perfil.habilidades[z].porcentaje|| "";
            }
        }

        if (perfil.fotoUrl) {
            fotoGlobalUrl = perfil.fotoUrl;
        } else {
            fotoGlobalUrl = "";
        }
        actualizarFotoPreview();
        updatePreview();
    }

    function limpiarFormulario() {   
        eliminarAllHabilidades();
        diceEdicion = -1;
        const indice = document.getElementById("indiceEdicion");
        if (indice) indice.value = "-1";
        cargarFormulario({
            nombres: "",
            apellidos: "",
            edad: "",
            telefono: "",
            correo: "",
            ciudadNacimiento: "",
            ciudadResidencia: "",
            ocupacion: "",
            github: "",
            linkedin: "",
            biografia: "",
            experiencia: "",
            fotoUrl: "",
            nombreHabilidad:"",
            porcentajeHabilidad:""
        });
    }

    // ==========================
    // VISTA PREVIA
    // ==========================
    function actualizarFotoPreview() {
        const img = document.getElementById("previewPhotoImg");
        const txt = document.getElementById("previewPhotoText");
        if (!img) return;

        if (fotoGlobalUrl) {
            img.src = fotoGlobalUrl;
            img.style.display = "block";
            if (txt) txt.style.display = "none";
        } else {
            img.style.display = "none";
            if (txt) txt.style.display = "flex";
        }
    }

    function updatePreview() {
        const p = leerFormulario();
        const nombreCompleto = (p.nombres + " " + p.apellidos).trim() || "—";

        document.getElementById("previewNombre").textContent = nombreCompleto;
        document.getElementById("previewEdad").textContent = p.edad || "—";
        document.getElementById("previewTelefono").textContent = p.telefono || "—";
        document.getElementById("previewCorreo").textContent = p.correo || "—";
        document.getElementById("previewCiudadResidencia").textContent = p.ciudadResidencia || "—";
        document.getElementById("previewOcupacion").textContent = p.ocupacion || "—";
        document.getElementById("previewBiografia").textContent = p.biografia || "—";
        document.getElementById("previewExperiencia").textContent = p.experiencia || "—";
        
        document.getElementById("previewNombreHabilidad").textContent = p.nombreHabilidad.toUpperCase() || "—";
        document.getElementById("previewPorcentajeHabilidad").textContent = p.porcentajeHabilidad + "%" || "—";
        document.getElementById("frontcircle").setAttribute("stroke-dashoffset",-(364 * p.porcentajeHabilidad / 100 - 364));

        for (let i = 0; i < contador; i++) {
            document.getElementById("previewNombreHabilidad_" + i).textContent = p.habilidades[i].nombre.toUpperCase() || "—";
            document.getElementById("previewPorcentajeHabilidad_" + i).textContent = p.habilidades[i].porcentaje + "%" || "—";
            document.getElementById("frontcircle_" + i).setAttribute("stroke-dashoffset", -(364 * p.habilidades[i].porcentaje / 100 - 364)); 
        }
    }

    // ==========================
    // GUARDAR PERFIL
    // ==========================
    function guardarPerfil() {
        const p = leerFormulario();

        if (!p.nombres || !p.apellidos || !p.edad) {
            alert("Para guardar el perfil debes ingresar nombre, apellidos y edad.");
            return;
        }

        if (indiceEdicion >= 0 && indiceEdicion < perfiles.length) {
            perfiles[indiceEdicion] = p;
        } else {
            perfiles.push(p);
        }
        activarTab("ver");
        guardarPerfilesEnStorage();
        renderEditarListado();
        renderVerListado();
        limpiarFormulario();
        setBannerPortafolio();
    }
    
    function agregarHabilidades() {
        let plantilla = document.getElementById("nuevaHabilidad");
        let plantilla1 = document.getElementById("progressHabilidad");
        
        let copia = plantilla.cloneNode(true);
        let copia1 = plantilla1.cloneNode(true);
        
        copia.style.display = "block";
        copia1.style.display = "inline";

        copia.id = "habilidades_" + contador;
        copia1.id = "habilidadProgress_" + contador;

        let nombreInput = copia.querySelector("#inputNombreHabilidad");
        let porcentajeInput = copia.querySelector("#inputPorcentajeHabilidad");
        
        let nombreHabilidadText = copia1.querySelector("#previewNombreHabilidad");
        let porcentajeHabilidadText = copia1.querySelector("#previewPorcentajeHabilidad");
        let frontCircle = copia1.querySelector("#frontcircle");
        
        nombreInput.id = "inputNombreHabilidad_" + contador;
        nombreInput.value = "";
        
        porcentajeInput.id = "inputPorcentajeHabilidad_" + contador;
        porcentajeInput.value = "";
        
        nombreHabilidadText.id = "previewNombreHabilidad_" + contador;
        nombreHabilidadText.textContent = "—";
               
        porcentajeHabilidadText.id = "previewPorcentajeHabilidad_" + contador;
        porcentajeHabilidadText.textContent = "%";
        
        frontCircle.id = "frontcircle_" + contador;
        frontCircle.setAttribute("stroke-dashoffset", 364);
                  
        document.getElementById("nuevaHabilidadForm").appendChild(copia);
        document.getElementById("nuevaHabilidadPreview").appendChild(copia1);
        
        contador++;
    }

    function eliminarHabilidades() {
        if (contador > 0) {
            const index = contador - 1;

            const formBlock = document.getElementById("habilidades_" + index);
            if (formBlock) formBlock.remove();

            const previewBlock = document.getElementById("habilidadProgress_" + index);
            if (previewBlock) previewBlock.remove();

            const detalleBlock = document.getElementById("habilidadProgressDatalle_" + index);
            if (detalleBlock) previewBlock.remove();

            contador--;
        }
    }

    function eliminarAllHabilidades() {
        while (contador > 0) {
            eliminarHabilidades();
        }
    }

    function eliminarFormulario() {
        if (!confirm("¿Deseas borrar los datos del formulario?")) return;
        limpiarFormulario();
        updatePreview();
    }

    // ==========================
    // LISTADOS
    // ==========================
    function renderEditarListado() {
        const cont = document.getElementById("editarListado");
        if (!cont) return;
        cont.innerHTML = "";

        perfiles.forEach(function (p, idx) {
            const item = document.createElement("div");
            item.className = "profile-list-item";

            const main = document.createElement("div");
            main.className = "profile-list-main";

            const fotoCaja = document.createElement("div");
            fotoCaja.className = "profile-list-photo-mini";
            if (p.fotoUrl) {
                const img = document.createElement("img");
                img.src = p.fotoUrl;
                fotoCaja.appendChild(img);
            } else {
                fotoCaja.textContent = "Foto";
            }

            const text = document.createElement("div");
            text.className = "profile-list-text";

            const nombre = (p.nombres + " " + p.apellidos).trim() || "(Sin nombre)";
            const edad = p.edad || "—";
            const bio = p.biografia || "Sin biografía registrada.";

            const nameNode = document.createElement("div");
            nameNode.className = "profile-list-name";
            nameNode.textContent = nombre;

            const metaNode = document.createElement("div");
            metaNode.className = "profile-list-meta";
            metaNode.textContent = "Edad: " + edad + " · " + (p.ocupacion || "Sin ocupación");

            const bioNode = document.createElement("div");
            bioNode.className = "profile-list-bio";
            bioNode.textContent = bio.length > 70 ? bio.substring(0, 67) + "..." : bio;

            text.appendChild(nameNode);
            text.appendChild(metaNode);
            text.appendChild(bioNode);

            main.appendChild(fotoCaja);
            main.appendChild(text);

            const actions = document.createElement("div");
            actions.className = "profile-list-actions";

            const btnEditar = document.createElement("button");
            btnEditar.className = "btn-secondary btn-small";
            btnEditar.textContent = "Editar";
            btnEditar.onclick = function () {      
                indiceEdicion = idx;
                const indice = document.getElementById("indiceEdicion");
                if (indice) indice.value = String(idx);            
                activarTab("agregar");
                for(let i = 0; i < p.habilidades.length; i++){
                    agregarHabilidades();
                }
                cargarFormulario(p);  
            };

            const btnEliminar = document.createElement("button");
            btnEliminar.className = "btn-danger btn-small";
            btnEliminar.textContent = "Eliminar";
            btnEliminar.onclick = function () {
                if (!confirm("¿Eliminar este perfil?")) return;
                perfiles.splice(idx, 1);
                guardarPerfilesEnStorage();
                renderEditarListado();
                renderVerListado();
            };

            actions.appendChild(btnEditar);
            actions.appendChild(btnEliminar);

            item.appendChild(main);
            item.appendChild(actions);
            cont.appendChild(item);
        });
    }

    function renderVerListado() {
        const cont = document.getElementById("verListado");
        if (!cont) return;
        cont.innerHTML = "";

        perfiles.forEach(function (p) {
            const item = document.createElement("div");
            item.className = "profile-list-item";

            const main = document.createElement("div");
            main.className = "profile-list-main";

            const fotoCaja = document.createElement("div");
            fotoCaja.className = "profile-list-photo-mini";
            if (p.fotoUrl) {
                const img = document.createElement("img");
                img.src = p.fotoUrl;
                fotoCaja.appendChild(img);
            } else {
                fotoCaja.textContent = "Foto";
            }

            const text = document.createElement("div");
            text.className = "profile-list-text";

            const nombre = (p.nombres + " " + p.apellidos).trim() || "(Sin nombre)";
            const edad = p.edad || "—";

            const nameNode = document.createElement("div");
            nameNode.className = "profile-list-name";
            nameNode.textContent = nombre;

            const metaNode = document.createElement("div");
            metaNode.className = "profile-list-meta";
            metaNode.textContent = "Edad: " + edad + " · " + (p.ocupacion || "Sin ocupación");

            text.appendChild(nameNode);
            text.appendChild(metaNode);

            main.appendChild(fotoCaja);
            main.appendChild(text);

            const actions = document.createElement("div");
            actions.className = "profile-list-actions";

            const btnVerMas = document.createElement("button");
            btnVerMas.className = "btn-soft btn-small";
            btnVerMas.textContent = "Ver más";
            btnVerMas.onclick = function () {
                mostrarDetallePerfil(p);
            };

            actions.appendChild(btnVerMas);

            item.appendChild(main);
            item.appendChild(actions);
            cont.appendChild(item);
        });
    }

    function mostrarDetallePerfil(p) {
        window.scrollTo({
        top: document.body.scrollHeight,
        behavior: "smooth"
        });

        const cont = document.getElementById("detalleVerPerfil");
        if (!cont) return;

        cont.style.display = "block";

        const nombreCompleto = (p.nombres + " " + p.apellidos).trim() || "(Sin nombre)";
        const edad = p.edad || "—";
        const telefono = p.telefono || "—";
        const correo = p.correo || "—";
        const ciudadNac = p.ciudadNacimiento || "—";
        const ciudadRes = p.ciudadResidencia || "—";
        const ocupacion = p.ocupacion || "—";
        const github = p.github || "";
        const linkedin = p.linkedin || "";
        const biografia = p.biografia || "—";
        const experiencia = p.experiencia || "—";
        const nombreHabilidad = p.nombreHabilidad || "—";
        const porcentajeHabilidad = p.porcentajeHabilidad || "—";
             
        let html = "";
        html += '<div style="margin-top:8px; padding:16px 14px; background:#fff7ed; border-radius:16px; border:1px solid #fed7aa;">';
        html += '  <div class="profile-title" style="margin-bottom:10px;">Detalle del perfil</div>';
        html += '  <div style="display:flex; gap:16px; flex-wrap:wrap; align-items:flex-start;">';

        html += '    <div class="preview-photo-wrapper" style="width:140px; height:140px;">';
        if (p.fotoUrl) {
            html += '      <img src="' + p.fotoUrl + '" alt="Foto de perfil" style="display:block;">';
        } else {
            html += '      <div class="preview-photo-placeholder">Sin foto</div>';
        }
        html += '    </div>';

        html += '    <div style="flex:1; min-width:220px;">';
        html += '      <p class="preview-text"><span class="label-strong">Nombre:</span> ' + nombreCompleto + '</p>';
        html += '      <p class="preview-text"><span class="label-strong">Edad:</span> ' + edad + '</p>';
        html += '      <p class="preview-text"><span class="label-strong">Teléfono:</span> ' + telefono + '</p>';
        html += '      <p class="preview-text"><span class="label-strong">Correo:</span> ' + correo + '</p>';
        html += '      <p class="preview-text"><span class="label-strong">Ciudad de nacimiento:</span> ' + ciudadNac + '</p>';
        html += '      <p class="preview-text"><span class="label-strong">Ciudad de residencia:</span> ' + ciudadRes + '</p>';
        html += '      <p class="preview-text"><span class="label-strong">Ocupación:</span> ' + ocupacion + '</p>';

        if (github) {
            html += '      <p class="preview-text"><span class="label-strong">GitHub:</span> <a href="' + github + '" target="_blank">' + github + '</a></p>';
        }
        if (linkedin) {
            html += '      <p class="preview-text"><span class="label-strong">LinkedIn:</span> <a href="' + linkedin + '" target="_blank">' + linkedin + '</a></p>';
        }

        html += '    </div>';
        html += '  </div>';

        html += '  <div style="margin-top:12px;">';
        html += '    <p class="preview-text"><span class="label-strong">Biografía:</span> ' + biografia + '</p>';
        html += '    <p class="preview-text"><span class="label-strong">Experiencia:</span> ' + experiencia + '</p>';
        html += '  </div>';

        //html += '</div>';
        
        
        html += '<h2 class="habilities">' + 'Habilidades' + '</h2>';
        
        html +=  '<div >';
        html +=     '<svg viewBox="-17 -17 170 170" version="1.1" xmlns="http://www.w3.org/2000/svg" style="transform:rotate(-90deg)">';
        html +=         '<text  class="habilityname" x="70" y="-3" style="transform:rotate(90deg) translate(0px, -145px)">' + p.nombreHabilidad.toUpperCase() + '</text>';
        html +=         '<circle class="backcircle">' + '</circle>';
        html +=         '<circle  class="frontcircle" stroke-dashoffset="'+ (-(364 * p.porcentajeHabilidad / 100 - 364)) + 'px">' + '</circle>';
        html +=         '<text class="textpercent" x="35px" y="80px" style="transform:rotate(90deg) translate(0px, -138px)">' + p.porcentajeHabilidad + '%' + '</text>';
        html +=     '</svg>';
            
        for (let i = 0; i < p.habilidades.length; i++) {
        agregarHabilidades();
        html +=     '<svg viewBox="-17 -17 170 170" version="1.1" xmlns="http://www.w3.org/2000/svg" style="transform:rotate(-90deg)">';
        html +=         '<text  class="habilityname" x="70" y="-3" style="transform:rotate(90deg) translate(0px, -145px)">' + p.habilidades[i].nombre.toUpperCase()+ '</text>';
        html +=         '<circle class="backcircle">' + '</circle>';
        html +=         '<circle  class="frontcircle" stroke-dashoffset="'+ (-(364 * p.habilidades[i].porcentaje / 100 - 364)) + 'px">' + '</circle>';
        html +=         '<text class="textpercent" x="35px" y="80px" style="transform:rotate(90deg) translate(0px, -138px)">' + p.habilidades[i].porcentaje + '%' + '</text>';
        html +=     '</svg>';}
        html += '</div>';
        html += '</div>';
        cont.innerHTML = html;
    }
    

    // ==========================
    // TABS
    // ==========================
    function activarTab(nombre) {
        eliminarAllHabilidades();
        document.querySelectorAll(".tab-button").forEach(function (btn) {
            btn.classList.toggle("active", btn.dataset.tab === nombre);
        });
        document.querySelectorAll(".tab-content").forEach(function (sec) {
            sec.classList.toggle("active", sec.id === "tab-" + nombre);
        });
    }

    document.querySelectorAll(".tab-button").forEach(function (btn) {
        btn.addEventListener("click", function () {
            const tab = btn.dataset.tab;
            activarTab(tab);
            if (tab === "ver") {
                setBannerPortafolio();
            }
        });
    });

    // ==========================
    // FOTO
    // ==========================
    const btnCargarFoto = document.getElementById("btnCargarFoto");
    const inputFoto = document.getElementById("inputFotoPerfil");

    if (btnCargarFoto && inputFoto) {
        btnCargarFoto.addEventListener("click", function () {
            inputFoto.click();
        });

        inputFoto.addEventListener("change", function (e) {
            const file = e.target.files[0];
            if (!file) return;

            const reader = new FileReader();
            reader.onload = function (ev) {
                fotoGlobalUrl = ev.target.result;
                actualizarFotoPreview();
                updatePreview();
            };
            reader.readAsDataURL(file);
        });
    }

    // ==========================
    // BANNER: abrir / cerrar
    // ==========================
    const toggleBannerEdit = document.getElementById("toggleBannerEdit");
    const closeBannerEdit = document.getElementById("closeBannerEdit");
    const bannerEditPanel = document.getElementById("bannerEditPanel");

    if (toggleBannerEdit && bannerEditPanel) {
        toggleBannerEdit.addEventListener("click", function () {
            bannerEditPanel.classList.add("open");
        });
    }
    if (closeBannerEdit && bannerEditPanel) {
        closeBannerEdit.addEventListener("click", function () {
            bannerEditPanel.classList.remove("open");
        });
    }

    const inputBannerTitulo = document.getElementById("inputBannerTitulo");
    const inputBannerSubtitulo = document.getElementById("inputBannerSubtitulo");
    if (inputBannerTitulo) inputBannerTitulo.addEventListener("input", syncMiniBannerPreview);
    if (inputBannerSubtitulo) inputBannerSubtitulo.addEventListener("input", syncMiniBannerPreview);

    // ==========================
    // ESTADO INICIAL
    // ==========================
    cargarPerfilesDesdeStorage();
    renderEditarListado();
    renderVerListado();
    limpiarFormulario();
    actualizarFotoPreview();
    updatePreview();
    setBannerPortafolio();
</script>

</body>
</html>

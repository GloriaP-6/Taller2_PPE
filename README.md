# Taller2_PPE
# 🎮 Videojuegos

Plataforma web desarrollada con Astro y Supabase para la gestión y visualización de videojuegos.

## 📋 Descripción

Este proyecto consiste en una aplicación web construida con Astro que permite interactuar con una base de datos alojada en Supabase.

## 🚀 Tecnologías Utilizadas

- Astro
- TypeScript
- Supabase
- HTML5
- CSS3
- JavaScript
- Node.js

## 📂 Estructura del Proyecto

```text
videojuegos/
│
├── public/              # Archivos públicos
├── src/                 # Código fuente
├── .astro/              # Archivos generados por Astro
├── .vscode/             # Configuración de VS Code
├── AGENTS.md
├── CLAUDE.md
├── astro.config.mjs
├── package.json
├── tsconfig.json
├── .env
├── .env.example
└── README.md
```

## ⚙️ Requisitos Previos

Antes de ejecutar el proyecto, asegúrate de tener instalado:

- Node.js 18 o superior
- npm 9 o superior
- Cuenta en Supabase

## 🔧 Instalación

Clona el repositorio:

```bash
git clone <URL_DEL_REPOSITORIO>
```

Ingresa a la carpeta del proyecto:

```bash
cd videojuegos
```

Instala las dependencias:

```bash
npm install
```

## 🔑 Configuración de Supabase

Crea un archivo `.env` tomando como referencia `.env.example`.

Ejemplo:

```env
PUBLIC_SUPABASE_URL=https://xxxxxxxx.supabase.co
PUBLIC_SUPABASE_ANON_KEY=tu_clave_anonima
```

Puedes obtener estos valores desde:

**Supabase → Project Settings → API**

## ▶️ Ejecutar en Desarrollo

```bash
npm run dev
```

La aplicación estará disponible en:

```text
http://localhost:4321
```

## 🏗️ Construcción para Producción

Generar el build:

```bash
npm run build
```

Vista previa local:

```bash
npm run preview
```

## 📦 Scripts Disponibles

```bash
npm run dev       # Ejecuta el servidor de desarrollo
npm run build     # Genera la versión de producción
npm run preview   # Vista previa del build
```

## 🌐 Despliegue

El proyecto puede desplegarse en:

- Vercel
- Netlify
- GitHub Pages (según configuración)
- Cloudflare Pages

## 👥 Integrantes

- Gloria Yuliana Peña Ibargüen
- Miguel Angel Jaramillo Urtado
- Luis Guillermo Velez Suarez

## 📄 Licencia

Proyecto académico desarrollado para la asignatura correspondiente.

# Taller2_PPE
# 🎮 Videojuegos

Plataforma web desarrollada con Astro y Supabase para la gestión y visualización de videojuegos, desplegada en Cloudflare Workers.

🌐 **URL pública:** `https://videojuegos.willy-videojuegos.workers.dev/` 

## 📋 Descripción

Aplicación construida con Astro que combina dos modos de renderizado en el mismo proyecto (arquitectura híbrida):

| Página | Ruta | Modo | Descripción |
| :-- | :-- | :-- | :-- |
| Catálogo | `/` | **SSR** | Consulta Supabase en el servidor en cada request. Búsqueda y paginación con `?q=...&page=2`. |
| Acerca de | `/acerca-de` | **SSG** | Página pública pre-renderizada en build. |
| Registro | `/registro` | **SSG** | Formulario de registro (`supabase.auth.signUp` desde el cliente). |
| Login | `/login` | **SSG** | Formulario de login (`supabase.auth.signInWithPassword` desde el cliente). |
| Administración | `/admin` | **SSG** | CRUD de juegos. Los datos llegan desde el cliente tras autenticarse; sin sesión redirige a `/login`. |

Todas las páginas usan un Layout común con `<ClientRouter />` (View Transitions) y un `<title>` dinámico por página.

## 🚀 Tecnologías Utilizadas

- Astro (adaptador de Cloudflare)
- TypeScript
- Supabase (Auth, base de datos y RLS)
- Cloudflare Workers
- HTML5, CSS3 y JavaScript

## 📂 Estructura del Proyecto

```text
videojuegos/
│
├── public/              # Archivos públicos
├── src/
│   ├── components/      # GameCard, SearchForm, FormField
│   ├── layouts/         # Layout.astro (ClientRouter + título dinámico)
│   ├── lib/             # supabase.ts (cliente compartido)
│   └── pages/           # index, acerca-de, login, registro, admin/
├── supabase/
│   └── rls-policies.sql # Políticas RLS de la tabla juegos
├── astro.config.mjs
├── wrangler.jsonc
├── package.json
├── tsconfig.json
├── .env.example
└── README.md
```

## ⚙️ Requisitos Previos

- Node.js 22.12 o superior
- npm 9 o superior
- Cuenta en Supabase
- Cuenta en Cloudflare (para el despliegue)

## 🔧 Instalación

```bash
git clone https://github.com/GloriaP-6/Taller2_PPE.git
cd Taller2_PPE/videojuegos
npm install
```

## 🔑 Configuración de Supabase

1. Crea un archivo `.env` dentro de `videojuegos/` tomando como referencia `.env.example`:

```env
PUBLIC_SUPABASE_URL=https://xxxxxxxx.supabase.co
PUBLIC_SUPABASE_ANON_KEY=tu_clave_anonima
```

Puedes obtener estos valores en **Supabase → Project Settings → API**.

2. Tabla `juegos` con las columnas `id`, `nombre`, `imagen`, `categoria`.

3. **Políticas RLS (obligatorio):** en Supabase → **SQL Editor**, ejecuta el contenido de `videojuegos/supabase/rls-policies.sql`. Esto deja la lectura pública y limita insertar, editar y eliminar a usuarios autenticados.

4. (Opcional en desarrollo) En **Authentication → Providers → Email**, puedes desactivar "Confirm email" para que el registro deje la sesión iniciada sin confirmar el correo.

## ▶️ Ejecutar en Desarrollo

```bash
npm run dev
```

La aplicación estará disponible en `http://localhost:4321`.

## 🏗️ Construcción para Producción

```bash
npm run build
npm run preview
```

## ☁️ Despliegue en Cloudflare Worker

Las variables `PUBLIC_*` se incrustan en el código **al hacer el build**, por eso el `.env` debe existir en la máquina que ejecuta el build.

```bash
npx wrangler login     # solo la primera vez
npm run deploy         # ejecuta astro build && wrangler deploy
```

Al terminar, Wrangler imprime la URL pública del Worker. Pégala en la parte superior de este README.

Si el build lo hace Cloudflare desde GitHub, define `PUBLIC_SUPABASE_URL` y `PUBLIC_SUPABASE_ANON_KEY` como variables de entorno del build en el panel de Cloudflare.

## 🔍 Cómo comprobar SSR vs SSG (Ctrl + U)

- En `/`: los nombres de los juegos aparecen en el HTML, incluso con JavaScript deshabilitado (SSR).
- En `/admin`: el HTML es el mismo para todos y no trae ningún juego; los datos llegan desde el cliente tras autenticarse (SSG).

## 📦 Scripts Disponibles

```bash
npm run dev       # Servidor de desarrollo
npm run build     # Build de producción
npm run preview   # Vista previa del build
npm run deploy    # Build + despliegue en Cloudflare
```

## 🌐 Despliegue
el proyecto se desplega en: 
- Cloudflare Pages
https://videojuegos.willy-videojuegos.workers.dev/
## 👥 Integrantes

- Gloria Yuliana Peña Ibargüen
- Miguel Angel Jaramillo Urtado
- Luis Guillermo Velez Suarez


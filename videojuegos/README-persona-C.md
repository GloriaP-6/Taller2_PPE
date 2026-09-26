# Persona C — Auth + CRUD protegido (SSG) + RLS

## Archivos que agrega esta parte

```
src/pages/login.astro          # formulario de login (SSG)
src/pages/registro.astro       # formulario de registro (SSG)
src/pages/admin/index.astro    # panel protegido: crear/editar/eliminar (SSG)
supabase/rls-policies.sql      # políticas RLS a correr en Supabase
```

## Cómo instalarlo en el repo

1. Copia `src/pages/login.astro`, `src/pages/registro.astro` y la carpeta
   `src/pages/admin/` dentro de `videojuegos/src/pages/` (respetando esas rutas).
2. En el Dashboard de Supabase → **SQL Editor** → pega el contenido de
   `supabase/rls-policies.sql` y ejecútalo. Esto es obligatorio: sin políticas
   RLS, Supabase bloquea todas las escrituras aunque el código esté bien.
3. Verifica que en Supabase, en **Authentication → Providers**, el proveedor
   de Email esté habilitado (viene así por defecto).
4. (Opcional pero recomendado para probar rápido en desarrollo): en
   **Authentication → Settings**, puedes desactivar "Confirm email" mientras
   pruebas, así el registro deja sesión activa de inmediato en vez de pedir
   confirmar el correo.

## Cómo probarlo

1. `npm run dev`, abre `/registro`, crea una cuenta.
2. Ve a `/login` e inicia sesión con esa cuenta.
3. Deberías caer en `/admin` — crea un juego, edítalo, elimínalo.
4. Cierra sesión (botón en `/admin`) y entra directo a `/admin` por la URL:
   debe redirigirte a `/login` (así se prueba que sin sesión no se puede
   administrar).
5. Con **Ctrl+U** en `/admin`, confirma que el HTML fuente NO trae ningún
   nombre de juego — todo se carga después, por JavaScript, a diferencia del
   listado de la Persona A que sí los trae en el HTML crudo (SSR).

## Notas para la sustentación

- Estas páginas usan `export const prerender = true`, así que Astro las
  genera como HTML estático en el build (SSG), aunque el resto del proyecto
  esté en modo `server` (SSR) por el adaptador de Cloudflare. Astro permite
  mezclar ambos modos página por página — eso se llama renderizado híbrido.
- Como son estáticas, no hay ningún código de servidor corriendo en
  `/admin` para decidir si el usuario tiene sesión: esa verificación pasa
  **enteramente en el navegador**, con `supabase.auth.getSession()`. Por eso
  aparece un mensaje de "Verificando sesión..." antes de mostrar el panel.
- La seguridad real no depende de esa verificación en el navegador (alguien
  podría editarla con las devtools) — depende de las **políticas RLS** en
  Supabase, que rechazan el `insert`/`update`/`delete` a nivel de base de
  datos si la petición no viene con un JWT de un usuario autenticado.

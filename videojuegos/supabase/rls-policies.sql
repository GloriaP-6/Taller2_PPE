-- Ejecutar en Supabase: Dashboard -> SQL Editor -> New query -> pegar y correr.
-- Sin esto, aunque el código del CRUD esté perfecto, Supabase va a rechazar
-- (o simplemente no dejar) las escrituras, porque por defecto RLS bloquea
-- todo una vez está activado.

alter table public.juegos enable row level security;

-- Lectura pública: la necesita el listado SSR de la Persona A, que consulta
-- Supabase sin que el usuario haya iniciado sesión.
create policy "Lectura publica de juegos"
on public.juegos
for select
to public
using (true);

-- Solo usuarios autenticados pueden crear juegos.
create policy "Usuarios autenticados pueden insertar juegos"
on public.juegos
for insert
to authenticated
with check (true);

-- Solo usuarios autenticados pueden editar juegos.
create policy "Usuarios autenticados pueden actualizar juegos"
on public.juegos
for update
to authenticated
using (true)
with check (true);

-- Solo usuarios autenticados pueden eliminar juegos.
create policy "Usuarios autenticados pueden eliminar juegos"
on public.juegos
for delete
to authenticated
using (true);

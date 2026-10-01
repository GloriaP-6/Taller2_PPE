// @ts-check
import { defineConfig } from 'astro/config';

import cloudflare from '@astrojs/cloudflare';

// https://astro.build/config
export default defineConfig({
  output: 'server',
  adapter: cloudflare({
    // 'compile' es el valor por defecto: usa sharp solo en rutas
    // prerenderizadas (como /acerca-de). Es la opción más segura
    // para Cloudflare Workers ya que evita depender de sharp en runtime.
    imageService: 'compile',
  }),
});

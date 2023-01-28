import { fileURLToPath } from 'url';
import { dirname, resolve } from 'path';

import adapterStatic from '@sveltejs/adapter-static';
import adapterNode from '@sveltejs/adapter-node';
import { vitePreprocess } from '@sveltejs/kit/vite';

import 'dotenv/config';
const toStatic = process.env.ADAPTER === 'static';

const adapter = toStatic ? adapterStatic : adapterNode;
const options = {
  fallback: toStatic ? 'error_page.html' : undefined,
  precompress: true
};

const __dirname = dirname(fileURLToPath(import.meta.url));

/** @type {import('@sveltejs/kit').Config} */
const config = {
  preprocess: vitePreprocess(),

  kit: {
    alias: {
      $iconify: resolve(__dirname, 'src/lib/assets/iconify')
    },

    adapter: adapter(options),

    files: {
      serviceWorker: 'node_modules/daks-svelte/app/service-worker'
    }

    // inlineStyleThreshold: 8192
  }
};

export default config;
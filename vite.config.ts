import { extname } from 'path';
import { imagetools } from 'vite-imagetools';
import { sveltekit } from '@sveltejs/kit/vite';
import type { UserConfig } from 'vite';

/*
import { promises as fs } from 'fs';
import { fileURLToPath } from 'url';
const pkg = JSON.parse(
  await fs.readFile(fileURLToPath(new URL('package.json', import.meta.url)), 'utf8')
);
process.env.APP_VERSION ??= pkg.version;
*/

const extensions = ['.png', '.jpg', '.jpeg'];

const config: UserConfig = {
  logLevel: 'error', // 'info'
  plugins: [
    imagetools({
      defaultDirectives: (url) => {
        const extension = extname(url.pathname);
        return new URLSearchParams(
          extensions.includes(extension)
            ? {
                quality: '90',
                fit: 'cover',
                background: 'transparent',
                meta: 'width;height;quality;src'
              }
            : undefined
        );
      }
    }),
    sveltekit()
  ],
  /*
  server: {
    fs: {
      strict: false
    }
  },
  define: {
    // 'process.env': process.env,
    // __APP_VERSION__: JSON.stringify(pkg.version)
  },
  */
  test: {
    include: ['src/**/*.{test,spec}.{js,ts}']
  }
};

export default config;

/// <reference types="@sveltejs/kit" />

/*
import type { ILazyLoadInstance } from 'vanilla-lazyload';

declare global {
  interface Document {
    lazyloadInstance: ILazyLoadInstance;
  }
}
*/

declare module '*.webp' {
  const value: string;
  export = value;
}

declare module '*.gif' {
  const value: string;
  export = value;
}

declare module '*.jpg' {
  const value: string;
  export = value;
}

declare module '*.jpeg' {
  const value: string;
  export = value;
}

declare module '*.png' {
  const value: string;
  export = value;
}

declare module '*.svg' {
  const value: string;
  export = value;
}

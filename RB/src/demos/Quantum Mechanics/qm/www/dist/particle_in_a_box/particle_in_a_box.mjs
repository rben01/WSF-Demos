var e,r,t,o,a,n,i={},s={};function p(e){var r=s[e];if(void 0!==r)return r.exports;var t=s[e]={id:e,loaded:!1,exports:{}};return i[e](t,t.exports,p),t.loaded=!0,t.exports}p.m=i,e="function"==typeof Symbol?Symbol("webpack queues"):"__webpack_queues__",r="function"==typeof Symbol?Symbol("webpack exports"):"__webpack_exports__",t="function"==typeof Symbol?Symbol("webpack error"):"__webpack_error__",o=e=>{e&&!e.d&&(e.d=1,e.forEach((e=>e.r--)),e.forEach((e=>e.r--?e.r++:e())))},p.a=(a,n,i)=>{var s;i&&((s=[]).d=1);var p,l,u,d=new Set,c=a.exports,m=new Promise(((e,r)=>{u=r,l=e}));m[r]=c,m[e]=e=>(s&&e(s),d.forEach(e),m.catch((e=>{}))),a.exports=m,n((a=>{var n;p=(a=>a.map((a=>{if(null!==a&&"object"==typeof a){if(a[e])return a;if(a.then){var n=[];n.d=0,a.then((e=>{i[r]=e,o(n)}),(e=>{i[t]=e,o(n)}));var i={};return i[e]=e=>e(n),i}}var s={};return s[e]=e=>{},s[r]=a,s})))(a);var i=()=>p.map((e=>{if(e[t])throw e[t];return e[r]})),l=new Promise((r=>{(n=()=>r(i)).r=0;var t=e=>e!==s&&!d.has(e)&&(d.add(e),e&&!e.d&&(n.r++,e.push(n)));p.map((r=>r[e](t)))}));return n.r?l:i()}),(e=>(e?u(m[t]=e):l(c),o(s)))),s&&(s.d=0)},p.n=e=>{var r=e&&e.__esModule?()=>e.default:()=>e;return p.d(r,{a:r}),r},p.d=(e,r)=>{for(var t in r)p.o(r,t)&&!p.o(e,t)&&Object.defineProperty(e,t,{enumerable:!0,get:r[t]})},p.f={},p.e=e=>Promise.all(Object.keys(p.f).reduce(((r,t)=>(p.f[t](e,r),r)),[])),p.u=e=>e+".mjs",p.hmd=e=>((e=Object.create(e)).children||(e.children=[]),Object.defineProperty(e,"exports",{enumerable:!0,set:()=>{throw new Error("ES Modules may not assign module.exports or exports.*, Use ESM export syntax, instead: "+e.id)}}),e),p.o=(e,r)=>Object.prototype.hasOwnProperty.call(e,r),a={},n="create-wasm-app:",p.l=(e,r,t,o)=>{if(a[e])a[e].push(r);else{var i,s;if(void 0!==t)for(var l=document.getElementsByTagName("script"),u=0;u<l.length;u++){var d=l[u];if(d.getAttribute("src")==e||d.getAttribute("data-webpack")==n+t){i=d;break}}i||(s=!0,(i=document.createElement("script")).type="module",i.charset="utf-8",i.timeout=120,p.nc&&i.setAttribute("nonce",p.nc),i.setAttribute("data-webpack",n+t),i.src=e),a[e]=[r];var c=(r,t)=>{i.onerror=i.onload=null,clearTimeout(m);var o=a[e];if(delete a[e],i.parentNode&&i.parentNode.removeChild(i),o&&o.forEach((e=>e(t))),r)return r(t)},m=setTimeout(c.bind(null,void 0,{type:"timeout",target:i}),12e4);i.onerror=c.bind(null,i.onerror),i.onload=c.bind(null,i.onload),s&&document.head.appendChild(i)}},p.r=e=>{"undefined"!=typeof Symbol&&Symbol.toStringTag&&Object.defineProperty(e,Symbol.toStringTag,{value:"Module"}),Object.defineProperty(e,"__esModule",{value:!0})},p.v=(e,r,t,o)=>{var a=fetch(p.p+""+t+".module.wasm");return"function"==typeof WebAssembly.instantiateStreaming?WebAssembly.instantiateStreaming(a,o).then((r=>Object.assign(e,r.instance.exports))):a.then((e=>e.arrayBuffer())).then((e=>WebAssembly.instantiate(e,o))).then((r=>Object.assign(e,r.instance.exports)))},(()=>{var e;if("string"==typeof import.meta.url&&(e=import.meta.url),!e)throw new Error("Automatic publicPath is not supported in this browser");e=e.replace(/#.*$/,"").replace(/\?.*$/,"").replace(/\/[^\/]+$/,"/"),p.p=e})(),(()=>{var e={578:0};p.f.j=(r,t)=>{var o=p.o(e,r)?e[r]:void 0;if(0!==o)if(o)t.push(o[2]);else{var a=new Promise(((t,a)=>o=e[r]=[t,a]));t.push(o[2]=a);var n=p.p+p.u(r),i=new Error;p.l(n,(t=>{if(p.o(e,r)&&(0!==(o=e[r])&&(e[r]=void 0),o)){var a=t&&("load"===t.type?"missing":t.type),n=t&&t.target&&t.target.src;i.message="Loading chunk "+r+" failed.\n("+a+": "+n+")",i.name="ChunkLoadError",i.type=a,i.request=n,o[1](i)}}),"chunk-"+r,r)}};var r=(r,t)=>{var o,a,[n,i,s]=t,l=0;if(n.some((r=>0!==e[r]))){for(o in i)p.o(i,o)&&(p.m[o]=i[o]);if(s)s(p)}for(r&&r(t);l<n.length;l++)a=n[l],p.o(e,a)&&e[a]&&e[a][0](),e[a]=0},t=self.webpackChunkcreate_wasm_app=self.webpackChunkcreate_wasm_app||[];t.forEach(r.bind(null,0)),t.push=r.bind(null,t.push.bind(t))})(),p.nc=void 0,Promise.all([p.e(903),p.e(314)]).then(p.bind(p,314)).catch((e=>console.error("Error importing `index.js`:",e)));
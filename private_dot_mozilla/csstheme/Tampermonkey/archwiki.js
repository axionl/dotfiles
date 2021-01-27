// ==UserScript==
// @name        ToC as side bar
// @namespace   https://franklinyu.name
// @match       https://wiki.archlinux.org/*
// @grant       GM_addStyle
// @version     0.2
// @author      Franklin Yu
// @description Restrict width and move Table of Content to the right side.
// ==/UserScript==

const search_result = document.querySelector(".mw-search-result");

if (!search_result) {
  const toc = document.getElementById("toc");
  const container = document.getElementById("mw-content-text");
  container.append(toc);

  GM_addStyle(`
#mw-content-text {
display: flex;
}

.mw-parser-output {
max-width: calc(100vw - 100px);
}

#toc {
top: 10px;
margin: 16px;
padding: 20px;
position: sticky;
min-width: 24vw;
background-color: white;
border-radius: 16px;
box-shadow: 1px 1px 8px 1px #88888822;
}

#toc > ul {
max-height: calc(100vh - 80px);
overflow-y: auto;
}
`);
}

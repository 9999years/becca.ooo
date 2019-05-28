import { h, $ } from "./fake.js"
import { range, chain } from "./iter.js"

function headers(): IterableIterator<HTMLElement> {
    const main = $("main") || document
    const _headers = (_: any, i: number) => Array.from(
        main.getElementsByTagName("h" + i) as HTMLCollectionOf<HTMLElement>)
        .filter(el => !el.className.includes("title"))
    return chain(Array.from(range(1, 7)).map(_headers))
}

const headerLink = (header: HTMLElement) =>
    <a class="ref" href={"#" + header.id}>#</a>

const addLink = (header: HTMLElement) => header.prepend(headerLink(header))

document.addEventListener("DOMContentLoaded", () => {
    Array.from(headers()).forEach(addLink)
})

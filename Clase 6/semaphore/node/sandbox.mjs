import { Identity } from "@semaphore-protocol/identity"
import { Group } from "@semaphore-protocol/group"
import { generateProof } from "@semaphore-protocol/proof"
import { verifyProof } from "@semaphore-protocol/proof"
import * as fs from 'fs';
import { generateSignalHash } from "@semaphore-protocol/proof"


const idPapasaurio = new Identity("papasaurio")
const idBebezilla = new Identity("bebezilla")
const idMamazilla = new Identity("mamazilla")

const group = new Group()
group.addMember([idPapasaurio._commitment])
group.addMember([idBebezilla._commitment])

console.log(idPapasaurio)

const externalNullifier = group.root
const signal = "SI"

const fullProof = await generateProof(idPapasaurio, group, externalNullifier, signal, {
    zkeyFilePath: "../static/semaphore.zkey",
    wasmFilePath: "../static/semaphore.wasm"
})
console.log(fullProof)


const verificationKey = JSON.parse(fs.readFileSync("../static/semaphore.json", "utf-8"))

verifyProof(verificationKey,fullProof).then((r)=>{
    console.log(r)
})

console.log(generateSignalHash("SI"))

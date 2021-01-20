/**
 *  simple interest => p,t,r
 * ECMA 6,7,8
 */
const si = ( p,t,r) =>{

    if(p && t && r){
        const simpleInt = (p *t*r)/100;
        return simpleInt;
    }
    return 0;
}

const add = (n1 , n2) =>{

    return n1+n2;
}
export {si , add}
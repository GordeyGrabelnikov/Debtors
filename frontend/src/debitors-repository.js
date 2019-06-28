
 export function show(id){
    return fetch(`/debtors/${id}`)
        .then((response) => response.json())
        .then((debtor) => ({
            firstName: debtor.first_name,
            lastName: debtor.last_name,
            image: debtor.image.url,
            debits:  (debtor.debits || []).map((debit) => ({
                ...debit,
                amount: +debit.amount
            }))
     }));
}

export function getAll(){
    return fetch('/debtors')
        .then((response) => response.json())
        .then((debtors) => debtors.map((debtor) => ({
            id: debtor.id,
            firstName: debtor.first_name,
            lastName: debtor.last_name,
            image: debtor.image.url,
            debit: debtor.debit || 0
        })));
}

 export function edit(debtor){
     return fetch(`/debtors/${debtor.id}`, {
        method: 'put',
        body: JSON.stringify({
            first_name: debtor.firstName, 
            last_name: debtor.lastName, 
            remote_image_url: debtor.imageUrl, 
            debits: debtor.debits,
        }),
        headers: {
            'content-type': 'application/json'
        }
     })
    
 }

export function add(debitor){
    return fetch('/debtors', {
        method: 'post',
        body: JSON.stringify({
            first_name: debitor.firstName, 
            last_name: debitor.lastName,
            amount: debitor.debit || 0, 
            date: debitor.date,
            remote_image_url : debitor.imageUrl
        }),
        headers: {
            'content-type': 'application/json'
        }
    })
        
}

export function del(debtor){
    return fetch(`/debtors/${debtor.id}`, {
        method: 'delete'
    })
}
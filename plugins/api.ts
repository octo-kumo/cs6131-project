export function get(url: string) {
  return fetch(url).then(res => res.json()).then((res) => {
    if (res.status === "success") return res
    else throw res.error
  })
}

export function post(url: string, body: any) {
  return fetch(url, {
    method: "POST",
    body: JSON.stringify(body),
    headers: {
      'Accept': 'application/json',
      'Content-Type': 'application/json'
    }
  }).then(res => res.json()).then((res) => {
    if (res.status === "success") return res
    else throw res.error
  })
}

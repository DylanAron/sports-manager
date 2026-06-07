import request from '@/utils/request'

export const selectByPage = (data) => request({ url: "/business/corner/selectByPage", method: "post", data })
export const uploadImage = (data) => request({ url: "/business/corner/uploadImage", method: "post", headers: { 'Content-Type': 'multipart/form-data' }, data })
export const add = (data) => request({ url: "/business/corner/add", method: "post", data })
export const edit = (data) => request({ url: "/business/corner/edit", method: "post", data })
export const del = (id) => request({ url: "/business/corner/delete", method: "post", params: { id } })

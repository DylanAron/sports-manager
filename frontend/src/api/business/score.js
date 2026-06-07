import request from '@/utils/request'

export const selectByPage = (data) => request({ url: "/business/score/selectByPage", method: "post", data })
export const uploadImage = (data) => request({ url: "/business/score/uploadImage", method: "post", headers: { 'Content-Type': 'multipart/form-data' }, data })
export const add = (data) => request({ url: "/business/score/add", method: "post", data })
export const edit = (data) => request({ url: "/business/score/edit", method: "post", data })
export const del = (id) => request({ url: "/business/score/delete", method: "post", params: { id } })

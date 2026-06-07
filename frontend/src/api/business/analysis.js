import request from '@/utils/request'

export const selectByPage = (data) => request({ url: "/business/analysis/selectByPage", method: "post", data })
export const uploadImage = (data) => request({ url: "/business/analysis/uploadImage", method: "post", headers: { 'Content-Type': 'multipart/form-data' }, data })
export const add = (data) => request({ url: "/business/analysis/add", method: "post", data })
export const edit = (data) => request({ url: "/business/analysis/edit", method: "post", data })
export const del = (id) => request({ url: "/business/analysis/delete", method: "post", params: { id } })

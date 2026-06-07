import request from '@/utils/request'

export const selectByPage = (data) => request({ url: "/business/goal/selectByPage", method: "post", data })
export const uploadImage = (data) => request({ url: "/business/goal/uploadImage", method: "post", headers: { 'Content-Type': 'multipart/form-data' }, data })
export const add = (data) => request({ url: "/business/goal/add", method: "post", data })
export const edit = (data) => request({ url: "/business/goal/edit", method: "post", data })
export const del = (id) => request({ url: "/business/goal/delete", method: "post", params: { id } })

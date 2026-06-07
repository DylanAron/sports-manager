import request from '@/utils/request'

export const selectByPage = (data) => request({ url: "/business/halffull/selectByPage", method: "post", data })
export const uploadImage = (data) => request({ url: "/business/halffull/uploadImage", method: "post", headers: { 'Content-Type': 'multipart/form-data' }, data })
export const add = (data) => request({ url: "/business/halffull/add", method: "post", data })
export const edit = (data) => request({ url: "/business/halffull/edit", method: "post", data })
export const del = (id) => request({ url: "/business/halffull/delete", method: "post", params: { id } })

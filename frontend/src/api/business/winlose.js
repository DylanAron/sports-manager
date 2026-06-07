import request from '@/utils/request'

// 分页查询
export const selectByPage = (data) => {
  return request({
    url: "/business/winlose/selectByPage",
    method: "post",
    data: data
  })
}

// 图片上传
export const uploadImage = (data) => {
  return request({
    url: "/business/winlose/uploadImage",
    method: "post",
    headers: { 'Content-Type': 'multipart/form-data' },
    data: data
  })
}

// 新增
export const add = (data) => {
  return request({
    url: "/business/winlose/add",
    method: "post",
    data: data
  })
}

// 修改
export const edit = (data) => {
  return request({
    url: "/business/winlose/edit",
    method: "post",
    data: data
  })
}

// 删除
export const del = (id) => {
  return request({
    url: "/business/winlose/delete",
    method: "post",
    params: { id }
  })
}

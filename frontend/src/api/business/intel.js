import request from '@/utils/request'

//获取情报列表（按日期范围）
export const getIntelList = (startDate, endDate) => {
  return request({
    url: "/business/intel/list",
    method: "get",
    params: { startDate, endDate }
  })
}

//获取情报详情
export const getIntelData = (id) => {
  return request({
    url: "/business/intel/get",
    method: "get",
    params: { id }
  })
}

//更新
export const update = (data) => {
  return request({
    url: "/business/intel/update",
    method: "post",
    data: data
  })
}

//新增
export const add = (data) => {
  return request({
    url: "/business/intel/add",
    method: "post",
    data: data
  })
}

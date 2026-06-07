import request from '@/utils/request'

// 上传图片
export const uploadImage = (data) => {
	return request({
		url: '/common/uploadImage',
		method: "post",
		headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
		data: data
	})
}
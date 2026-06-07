<template>
	<!-- 添加锦鲤扫盘-->
	<el-dialog v-model="props.isOpen" :title="props.title" min-width="620" align-center
		@close="emit('update',{reload: false})" class="koifish">
		<div class="match-body">
			<el-form :inline="true" :model="form" label-position="right">
				<el-form-item label="赛事日期" required>
					<div><el-date-picker v-model="form.matchDate" type="date" placeholder="选择日期"
							value-format="YYYY-MM-DD" /></div>
				</el-form-item>
				<el-form-item label="联赛名称" required>
					<el-input v-model="form.leagueName" autocomplete="off" placeholder="英超" />
				</el-form-item>
				<el-form-item label="赛事时间" required>
					<el-date-picker v-model="form.matchTime" type="datetime" placeholder="赛事时间"
						value-format="YYYY-MM-DD HH:mm:ss" />
				</el-form-item>
				<el-form-item label="序列号&nbsp;&nbsp;&nbsp;" required>
					<el-input v-model="form.serialize" autocomplete="off" placeholder="序列号(周四001)" />
				</el-form-item>
				
				<el-form-item label="主队名称" required>
					<el-input v-model="form.homeName" autocomplete="off" placeholder="主队名称" />
				</el-form-item>
				<el-form-item label="客队名称" required>
					<el-input v-model="form.guestName" autocomplete="off" placeholder="客队名称" />
				</el-form-item>
				<el-form-item label="赛事状态" required>
					<el-select v-model="form.matchStatus" placeholder="赛事状态">
						<el-option v-for="item in data.status" :key="item.value" :label="item.label"
							:value="item.value" />
					</el-select>
				</el-form-item>
				<el-form-item label="全场比分" required v-if="form.matchStatus==1">
					<el-input v-model="form.fullScore" autocomplete="off" placeholder="全场比分" />
				</el-form-item>
				<el-form-item label="是否命中" v-if="form.matchStatus==1" required>
					<el-select v-model="form.isHit" placeholder="是否命中">
						<el-option v-for="(hitItem,index) in data.hitList" :key="hitItem.value"
							:label="hitItem.label" :value="hitItem.value" />
					</el-select>
				</el-form-item>
			</el-form>
		</div>
		<template #footer>
			<div class="dialog-footer">
				<el-button @click="emit('update',{type: 0,reload: false})">取消</el-button>
				<el-button type="primary" @click="doSubmit">
					确认
				</el-button>
			</div>
		</template>

	</el-dialog>

</template>

<script setup>
	import { nextTick, reactive, ref } from 'vue';
	import { Plus, Minus, Delete } from '@element-plus/icons-vue'
	import UploadProps from 'element-plus'
	import { ElMessage } from 'element-plus'
	import { format, isToday } from 'date-fns';
	import { add as addMatch, update as updatekoiFish } from "@/api/business/koiFish";
	import useConvertHitResult from "@/hooks/useConvertHitResult"
	const BASE_API = import.meta.env.VITE_APP_BASE_API;
	const props = defineProps(['isOpen', 'title', 'form'])
	const emit = defineEmits(['update'])
	const { form } = props;
	const data = reactive({
		openAddDialog: props.openAddDialog,
		formLabelWidth: '140px',
		hitList: [{
				value: 0,
				label: '未命中',
			},
			{
				value: 1,
				label: '命中',
			},
		],
		status: [{
				value: 0,
				label: '未完场',
			},
			{
				value: 1,
				label: '已完场',
			},
		]
	})

	const beforeUpload = (file) => {
		if (file.type.indexOf("image/") == -1) {
			ElMessage.error("文件格式错误，请上传图片类型,如：JPG，PNG后缀的文件。");
		} else {
			const reader = new FileReader();
			reader.readAsDataURL(file);
			reader.onload = () => {
				image = reader.result;
			};
		}
	}

	//开始上传图片
	const doFileUpload = (option) => {
		const formData = new FormData();

		formData.append('file', option.file, option.file.name)

		uploadImage(formData).then(resp => {
			console.log("上传成功")
			form.payCode = resp.data
		})

	}

	const doSubmit = () => {

		if (form.leagueName == null || form.leagueName == '') {
			ElMessage.error("请填写联赛名");
			return;
		}

		if (form.serialize == null || form.serialize == '') {
			ElMessage.error("请填写序列号");
			return;
		}

		if (form.matchTime == null) {
			ElMessage.error("请填写比赛时间");
			return;
		}

		if (form.homeName == null || form.homeName == '') {
			ElMessage.error("请填写主队名称");
			return;
		}

		if (form.guestName == null || form.guestName == '') {
			ElMessage.error("请填写客队名称");
			return;
		}

		let params = form;
		if (form.id == null) {
			//添加
			addMatch(params).then(resp => {
				ElMessage.success("添加成功!");
				emit('update', { type: 0, reload: true })
			})
		} else {
			updatekoiFish(params).then(resp => {
				ElMessage.success("修改成功!");
				emit('update', { type: 1, reload: true })
			})
		}
	}
</script>

<style lang="scss" >
	.file-uploader {
		width: 178px;
		height: 178px;
		border: 1px red solid;
		display: flex;
		justify-content: center;
		align-items: center;
		border: 1px dashed var(--el-border-color);

		.file-uploader-icon {
			width: 178px;
			height: 178px;
		}

		.pay-code {
			width: 178px;
			height: 178px;
		}
	}

	.el-dialog.koifish {
		margin-top: 0 !important;
		/* 移除默认的margin */
		transform: translateY(-50%);
		/* 向上移动50% */
		top: 50%;

		/* 定位到视图的50% */
		.el-dialog__body {
			min-height: 300px;
			overflow: hidden;

			.el-form {
				display: inline-block;

				.el-form-item {
					align-items: center;

					.el-form-item__content {
						width: 220px;
					}
				}
			}


		}

	}
</style>
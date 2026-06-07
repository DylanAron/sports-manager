<template>
	<div class="main">
		<!-- 专家页面 -->
		<div class="search">
			<div class="expert-name">
				<el-input v-model="data.params.searchText" style="width: 240px" placeholder="请输入专家名称" />
				<el-button type="primary" :icon="Search" :loading="data.searchLoading" @click="doSearch">搜索</el-button>
				<el-button type="primary" :icon="Plus" @click="data.openAddExpertDialog=true">添加</el-button>
			</div>
		</div>
		<div class="body">
			<el-table :data="data.tableData" style="width: 100%">
				<el-table-column prop="id" label="ID" width="180" />
				<el-table-column prop="sort" label="排序" />
				<el-table-column prop="name" label="名称" width="180" />
				<el-table-column prop="avatar" label="头像" />
				<el-table-column prop="hitText" label="命中" />
				<el-table-column prop="continueNum" label="连红次数" />
				<el-table-column prop="createTime" label="创建时间" />
				<el-table-column fixed="right" label="操作" min-width="120">
					<template #default="scope">
						<el-button link type="primary" size="small" @click="handleEditClick(scope.row)">
							修改
						</el-button>
						<el-button link type="danger" size="small" @click="handleDelClick(scope.row)">删除</el-button>
					</template>
				</el-table-column>

			</el-table>
			<el-pagination :page-size="data.pageReq.pageSize" layout="prev, pager, next" :total="data.total" />
		</div>

		<div class="add-expert-div" v-if="data.openAddExpertDialog">
			<ExpertAdd :openAddExpertDialog="data.openAddExpertDialog" @update="listenComponentsChange"></ExpertAdd>
		</div>

		<div class="edit-expert-div" v-if="data.openEditExpertDialog">
			<ExpertEdit :openEditExpertDialog="data.openEditExpertDialog" :detail="data.current"
				@update="listenComponentsChange"></ExpertEdit>
		</div>
	</div>
</template>

<script setup>
	import { computed, onMounted, reactive } from 'vue';
	import { Search, Plus } from '@element-plus/icons-vue'
	import { getTableData, update } from "@/api/business/expert";
	import ExpertAdd from '@/components/Expert/add';
	import ExpertEdit from '@/components/Expert/update';
	import { ElMessage } from 'element-plus/es';
	const data = reactive({
		searchLoading: false,
		openAddExpertDialog: false,
		openEditExpertDialog: false,
		timer: null,
		tableData: [],
		total: 0,
		params: {
			searchText: ''
		},
		pageReq: {
			pageNum: 1,
			pageSize: 10
		},
		current: {}
	})

	onMounted(() => {
		doGetTableData();
	})


	//开始搜索
	const doSearch = async () => {
		data.searchLoading = true;
		try {
			await doGetTableData();
		} finally {
			data.timer = setTimeout(() => {
				data.searchLoading = false;
			}, 500)
		}
	}

	const doGetTableData = async () => {
		//获取请求参数
		let pageParams = data.pageReq;
		pageParams.data = data.params;

		await getTableData(pageParams).then(resp => {
			let result = resp.data;
			data.total = result.total;
			data.tableData = result.list;
		})
	}

	// 监听组件变换
	const listenComponentsChange = (params) => {
		switch (params.type) {
			case 0: //添加
				data.openAddExpertDialog = false;
				if (params.reload) {
					reload();
				}
				break;
			case 1: //修改
				data.openEditExpertDialog = false;
				if (params.reload) {
					reload();
				}
				break;
		}
	}

	const reload = () => {
		data.pageReq.pageNum = 1
		data.params.searchText = "";
		doGetTableData();
	}

	const handleEditClick = (row) => {
		data.current = row;
		data.openEditExpertDialog = true;
	}

	const handleDelClick = (row) => {
		let params = {
			id: row.id,
			status: -1
		}
		update(params).then(resp => {
			ElMessage.success("删除成功!")
			reload();
		})
	}
</script>

<style lang="scss" scoped>
	.main {
		position: absolute;
		height: 100%;
		width: 100%;
		padding: 20px;
		display: flex;
		flex-direction: column;

		.search {
			//height: 3rem;
			display: flex;
			align-items: center;
			padding-bottom: 1rem;
			border-bottom: 1px solid rgba(193, 193, 193, .3);

			.expert-name {
				display: flex;
				align-items: center;
			}

			.expert-name>button {
				margin-left: 20px;
			}

		}

		.body {
			height: 0px;
			flex-grow: 1;
			display: flex;
			flex-direction: column;
			align-items: center;

			.el-pagination {
				.el-table__inner-wrapper {
					overflow-x: scroll;
				}
			}
		}
	}
</style>
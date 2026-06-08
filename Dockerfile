# ============================================================
# Dockerfile - 多阶段构建（前端 + 后端 → 单镜像）
# ============================================================

# ---------- Stage 1: 构建前端 ----------
FROM node:20-alpine AS frontend-builder

WORKDIR /build

# 先复制依赖文件，利用 Docker 缓存层
COPY frontend/package*.json ./
RUN npm ci --registry=https://registry.npmmirror.com

# 复制前端源码并构建
COPY frontend/ .
RUN npm run build:prod

# ---------- Stage 2: 构建后端 ----------
FROM maven:3.9-eclipse-temurin-21 AS backend-builder

WORKDIR /build

# 将前端构建产物复制到后端静态资源目录下
COPY --from=frontend-builder /build/dist ./backend/src/main/resources/static

# 复制后端源码（先 pom.xml 再 src 以利用缓存）
COPY backend/pom.xml ./backend/
COPY backend/src ./backend/src/

# Maven 打包（跳过测试，阿里云镜像已在 pom.xml 中配置）
RUN mvn clean package -DskipTests -f ./backend/pom.xml

# ---------- Stage 3: 运行镜像 ----------
FROM eclipse-temurin:21-jre-alpine

WORKDIR /app

# 从构建阶段复制最终 JAR
COPY --from=backend-builder /build/backend/target/soccer.jar app.jar

# 创建日志目录
RUN mkdir -p /app/logs

EXPOSE 8080

# 默认 JVM 参数和 Spring 环境
ENV JAVA_OPTS="-Xms512m -Xmx1024m"
ENV SPRING_PROFILES_ACTIVE=prod

ENTRYPOINT ["sh", "-c", "java $JAVA_OPTS -jar app.jar --spring.profiles.active=$SPRING_PROFILES_ACTIVE"]

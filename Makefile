# 設定來源與目標專案路徑
CUBEMX_DIR := ../stm32f401
PIO_DIR := .

# 定義同步對應表（來源路徑:目標路徑）
SYNC_PAIRS := \
    Core/Src:$(PIO_DIR)/src \
    Core/Inc:$(PIO_DIR)/include \
    startup_stm32f401xe.s:$(PIO_DIR)/src/startup_stm32f401xe.s

# 主目標：同步 CubeMX → PlatformIO
sync: clean_pio
	@echo "🔄 同步 CubeMX → PlatformIO 專案"
	@$(foreach pair, $(SYNC_PAIRS), \
		src=$(word 1,$(subst :, ,$(pair))); \
		dst=$(word 2,$(subst :, ,$(pair))); \
		if [ -d $(CUBEMX_DIR)/$$src ]; then \
			echo "→ $$src → $$dst [dir]"; \
			rm -rf $$dst; \
			mkdir -p $$dst; \
			cp -r $(CUBEMX_DIR)/$$src/* $$dst/; \
		elif [ -f $(CUBEMX_DIR)/$$src ]; then \
			echo "→ $$src → $$dst [file]"; \
			cp $(CUBEMX_DIR)/$$src $$dst; \
		else \
			echo "⚠️ 找不到 $$src"; \
		fi; \
	)

# 可選目標：清除 PlatformIO HAL 相關內容
clean_pio:
	@echo "🧹 清除 PlatformIO 專案 HAL 檔案"
	@rm -rf $(PIO_DIR)/src/*
	@rm -rf $(PIO_DIR)/include/*
	@rm -rf $(PIO_DIR)/lib/HAL_Drivers

upload:
	cd $(PIO_DIR) && pio run -t upload

build:
	cd $(PIO_DIR) && pio run
	
.PHONY: sync clean_pio

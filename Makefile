PRODUCT_NAME := todays-recipe

.PHONY: generate-xcodeproj
generate-xcodeproj:
	mint run xcodegen xcodegen generate

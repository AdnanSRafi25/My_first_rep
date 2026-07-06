TOP = hello

build log:
	@mkdir -p $@
	@echo "*" > $@/.gitignore

build/$(TOP): build $(TOP).c
	@gcc -o build/$(TOP) $(TOP).c

.PHONY: run
run: build/$(TOP)
	@./build/$(TOP)

.PHONY: clean
clean:
	@rm -rf build log

.PHONY: all
all:
	@make -s clean
	@$(foreach my_var, $(shell find -name '*.c' | sed "s/.*\.\///g" | sed "s/\..*//g"), make -s run TOP=$(my_var);)
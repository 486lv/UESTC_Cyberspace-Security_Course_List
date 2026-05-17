.globl main

main:
    # 初始化地址
    lui $s0, 0xbf80       # $s0 = LED地址 (0xbf800000)
    addiu $s1, $s0, 8     # $s1 = 开关地址 (0xbf800008)

read_n:
    # 读取并去抖动
    jal debounce          # 调用去抖动函数
    lw $t0, 0($s1)        # 读取开关值
    andi $t0, $t0, 0x0F   # 取低4位（假设4位开关）
    beqz $t0, read_n      # n不能为0

    # 初始化斐波那契数列
    li $t1, 0            # F(0) = 0
    li $t2, 1            # F(1) = 1
    move $t3, $t0        # $t3 = 当前n值

fib_loop:
    # 显示当前数
    sw $t2, 0($s0)       # 显示F(n)到LED
    jal delay            # 调用延时函数

    # 计算下一个数
    add $t4, $t1, $t2    # F(n) = F(n-1) + F(n-2)
    move $t1, $t2
    move $t2, $t4

    # 动态读取新n值并比较
    jal debounce
    lw $t5, 0($s1)
    andi $t5, $t5, 0x0F
    beqz $t5, read_n      # 如果新n=0，重新初始化

    # 检查n是否变化
    beq $t3, $t5, no_change
    move $t3, $t5         # 更新n值
    li $t1, 0            # 重置数列
    li $t2, 1

no_change:
    # 减少计数器并循环
    addi $t3, $t3, -1
    bnez $t3, fib_loop
    j read_n             # 完成一轮后重新开始

# --- 子函数：延时 ---
delay:
    li $t6, 1000000      # 延时计数器
delay_loop:
    addi $t6, $t6, -1
    bnez $t6, delay_loop
    jr $ra

# --- 子函数：去抖动 ---
debounce:
    li $t7, 10000        # 去抖动延时
debounce_loop:
    addi $t7, $t7, -1
    bnez $t7, debounce_loop
    jr $ra
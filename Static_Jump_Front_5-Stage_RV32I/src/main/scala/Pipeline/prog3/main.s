.data
num_test: .word 8           
test1:    .word 0x3E800000, 0x42F6E979, 0x45D9CD93, 0x409C0AA6, 0x42430D50, 0x428A0000, 0x3F5D8C2A, 0x3B2A64C3
######test data ###### | ###### answer ###### | ###### hex ######
# 0.25                 | 0.5                  | 3F000000
# 123.45600128173828   | 11.11107561          | 4131c6f7
# 6969.69677734375     | 83.48470984          | 42a6f82c
# 4.876299858093262    | 2.208234557          | 400d53b7
# 48.76300048828125    | 6.983050944          | 40df7527
# 69                   | 8.306623863          | 4104e7ee
# 0.8654199838638306   | 0.9302795192         | 3f6e26cc        
# 0.0026000000070780516| 0.05099019514        | 3d50db18 
answer:  .word 0x9000    

.text
.globl main

main:
    addi sp, sp, -24        # Allocate stack space
                            # sp = @sp - 16

    sw ra, 20(sp)
    sw s4, 16(sp)
    sw s3, 12(sp)
    sw s2, 8(sp) 
    sw s1, 4(sp) 
    sw s0, 0(sp) 

    # 初始化變數
    la s0, num_test             # t0 = 地址(num_test)
    lw s1, 0(s0)                # t1 = 測試數量 (num_test)
    la s2, test1                # t2 = 測試資料起始地址 (test1)
    lw s3, answer              # t3 = 結果存放地址 (results)
    li s4, 0                    # t4 = 測試迴圈計數器 (index)

loop:
    # 檢查是否完成所有測試
    beq s4, s1, done            # 如果 t4 == t1，結束測試

    # 加載測試資料
    lw a0, 0(s2)                # a0 = rs1 (test[t4][0])
    
    # 呼叫 sqrtf 函式
    jal ra, sqrtf                 # 呼叫 mul，結果儲存在 a2
    mv  a2, a0
    # 儲存結果
    sw a2, 0(s3)                # 將 a2 儲存到 results[t4]

    # 更新地址和迴圈計數器
    addi s2, s2, 4              # 移動到下一組測試資料
    addi s3, s3, 4              # 移動到下一個結果地址
    addi s4, s4, 1              # 測試迴圈計數器 +1
    j loop                      # 返回迴圈

done:
    lw ra, 20(sp)
    lw s4, 16(sp)
    lw s3, 12(sp)
    lw s2, 8(sp) 
    lw s1, 4(sp) 
    lw s0, 0(sp) 
    addi sp, sp, 24
    ret
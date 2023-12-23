# verilog_Factorial_Calculator
2-2 디지털논리회로2, 컴퓨터공학기초실험2 Project


## Top
팩토리얼 연산 프로그램의 Top 모듈, BUS를 통해 ram과 FactoCore 모듈에 접근

## FactoCore
팩토리얼 연산이 진행되는 모듈

## BUS
ram과 FactoCore라는 두 Slave와 연결되어 주소값에 따라 다른 Slave를 Select하는 모듈

## ram
메모리 역할을 하는 모듈, 읽기 쓰기가 가능


# 🧠 RV32I 32-bit Single-Cycle CPU Design (SystemVerilog)

본 프로젝트는 오픈소스 명령어 집합 구조인 **RISC-V RV32I**를 기반으로, 단일 사이클(Single-Cycle) 아키텍처로 동작하는 32비트 CPU를 **SystemVerilog**로 구현한 결과물입니다. 명령어 시퀀스를 ROM에 저장하고, `Vivado 2020.2` 환경에서 RTL 시뮬레이션을 통해 명령어 흐름 및 연산 결과를 검증했습니다.

---

## 📌 프로젝트 개요

- **설계 구조**: Single-Cycle 기반의 32비트 RV32I CPU
- **명령어 세트**: RV32I (RISC-V Integer Base ISA)
- **설계 언어**: SystemVerilog
- **설계 툴**: Xilinx Vivado 2020.2
- **테스트**: ROM 기반 테스트벤치를 통한 시뮬레이션

---

## 🛠️ 개발 환경

| 항목             | 내용                       |
|------------------|----------------------------|
| 설계 언어         | SystemVerilog              |
| 개발 툴           | Xilinx Vivado 2020.2       |
| 시뮬레이션 툴     | Vivado Simulator           |
| 합성 도구         | Vivado Synthesis           |
| 테스트 환경       | ROM 기반 테스트벤치 사용   |

---

## 📂 디렉토리 구조

```bash
├── sim_1
│   └── new
│       └── tb_RV32I.sv        # 테스트벤치 파일
├── sources_1                  # 주요 설계 소스 (.sv)
│   ├── ControlUnit.sv
│   ├── DataPath.sv
│   ├── defines.sv
│   ├── MCU.sv
│   ├── ram.sv
│   ├── rom.sv
│   └── RV32I_Core.sv
└── README.md

##🔧 주요 설계 파일 설명
파일명	설명
RV32I_Core.sv	최상위 CPU 모듈. DataPath와 ControlUnit을 인스턴스화하고 연결
ControlUnit.sv	opcode 및 funct 필드를 기반으로 각 제어 신호 생성
DataPath.sv	레지스터 파일, PC, ALU, 메모리 등을 포함한 데이터 경로 구성
rom.sv	명령어 메모리. 테스트용 프로그램 시퀀스를 저장
ram.sv	데이터 메모리. Load/Store 명령어에서 접근
MCU.sv	ALU 제어 유닛. funct3, funct7에 따라 ALU operation 지정
defines.sv	명령어 종류, ALU 코드 등을 상수로 정의한 헤더 파일
tb_RV32I.sv	테스트벤치. 명령어 흐름과 레지스터/메모리 상태 확인
📐 데이터패스 구조
싱글 사이클 데이터패스는 아래의 요소들로 구성됩니다:

Program Counter (PC)

Instruction Memory (ROM)

Register File (x0~x31)

ALU 및 ALU Control

MUX / Immediate Generator

Control Unit

Data Memory (RAM)

모든 명령어는 하나의 클럭 사이클 내에서 처리되며, ControlUnit과 MCU가 연산 제어를 담당합니다.

##🧪 명령어 검증
ROM에 미리 작성된 명령어 시퀀스를 통해 다음 명령어들의 동작을 검증했습니다:

##✔ 지원 명령어 목록
R-type
ADD, SUB, SLL, SRL, SRA, SLT, SLTU, XOR, OR, AND

I-type
ADDI, SLTI, XORI, ORI, ANDI, SLLI, SRLI, SRAI

S-type / L-type
SW, SH, SB, LW, LH, LB, LHU, LBU

B-type
BEQ, BNE, BLT, BGE, BLTU, BGEU

J/LU-type
JAL, JALR, LUI, AUIPC

##🧪 검증 방식
각 명령어를 ROM에 삽입 → 시뮬레이션에서 레지스터/메모리 상태 확인

조건 분기 및 점프 명령은 PC 변화 확인

ALU 연산 결과는 레지스터 값으로 비교 검증

##💡 프로젝트에서 배운 점
항목	내용
명령어 흐름 파악	명령어가 어떻게 fetch → decode → execute 되는지 구조적으로 이해
구조적 사고	모듈화를 통해 이론과 실제를 연결하며 직관적 이해
설계 최적화	불필요한 연결 제거 및 필요한 신호만 선택적으로 연결
다양한 설계 방식 학습	같은 동작을 다양한 방법으로 구현하는 사고 확장
---
##✅ 실행 방법
Vivado에서 새로운 프로젝트 생성 후 sources_1/ 경로의 파일 추가

테스트벤치(sim_1/new/tb_RV32I.sv)를 top module로 설정

시뮬레이션 실행 후 waveform 분석

레지스터 및 메모리 결과 확인
---
##📝 참고 사항
본 프로젝트는 FPGA에 직접 올리지는 않았으며, 시뮬레이션 중심으로 설계 및 검증됨

ROM에 들어가는 명령어는 rom.sv 파일 내에서 초기화되어 있음

Vivado 2020.2 기준으로 설계됨 (AMD Xilinx)
---
##🙏 마무리
이 프로젝트는 RV32I 명령어 구조와 CPU 설계 방법론을 학습하기 위한 교육용 프로젝트로, 단일 사이클 기반의 구조를 바탕으로 명령어의 실제 동작을 구현하며 하드웨어 설계자로서의 감각과 구조적 사고를 키울 수 있었습니다.

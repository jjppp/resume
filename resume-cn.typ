#import "chicv.typ": *

#show: chicv

#let private_info = json("resume-private/private_info.json")
#let resume_name = private_info.name_cn
#let resume_phone = private_info.phone

= #redact(alter: "jpwang")[#resume_name]

#fa[#phone] #redact(mark: true)[#resume_phone] |
#fa[#envelope] jpwang\@smail.nju.edu.cn |
#fa[#github] #link("https://github.com/jjppp")[jjppp] |
#fa[#globe] #link("https://jjppp.github.io")[jjppp.github.io]

== #fa[#graduation-cap] 教育背景

#cventry(
  tl: [南京大学],
  tr: [2024.09 - 2027.06 (预计)],
)[
  硕士, 计算机科学与技术｜#link("https://pascal-lab.net")[PASCAL Lab], 导师：李#redact(mark: true)[樾]｜研究方向: *程序语言*与*程序分析* #linebreak()
  助教工作: 计算机程序的构造和解释 (SICP/CS61a, *Python｜Scheme*, 2024 秋、2025 秋)
]
#cventry(
  tl: [南京大学],
  tr: [2020.09 - 2024.06],
)[
  本科, 信息与计算科学 (强基计划) | GPA: 4.54/5.00 #linebreak()
  *优秀毕业生*｜*基础学科专项奖学金*｜ICPC 2021 区域赛*银牌*
]

== #fa[#briefcase] 工作经历

#cventry(
  tl: [深度求索 (DeepSeek)],
  bl: [服务端组],
  br: [线上服务实习生],
  tr: [2026.07 - 至今],
)[
  - 负责线上服务 (聊天、API 平台) 的账号和鉴权系统
  - 负责多因子认证功能 (MFA)。通过接入基于签名的可信设备认证体系，实现了对用户几乎无感的 DeepSeek 账号多因子认证流程
  - 负责短信/邮件验证码基础设施，从 0 搭建验证码统计服务以优化可观测性 (回填率、回填时间、请求量等)，指导供应商选择
]

== #fa[#file] 学术论文

#cventry(
  tl: [Java 别名分析加速技术研究],
  tr: [#link("https://2026.splashcon.org/details/oopsla-2026/111/Heap-Abstraction-via-Early-Confluent-Object-Merging-for-Pointer-Analysis")[OOPSLA 2026] (*CCF-A*), *共一第一*],
  //   br: [#link("https://vide.pascal-lab.net")[VIDE]],
)[
  - 提出基于*堆抽象*的别名分析 (Alias Analysis) 加速方法, 旨在优化*编译器*、*程序分析器*的别名分析效率
  - 相比基线获得*平均 40x 加速*, 平均精度仅丢失 0.4%, 在*函数内联*、*逃逸分析*、*副作用分析*等6项指标上优于已有最先进算法
  - 从理论上刻画抽象方法的*精度保障*, 为性能-精度 trade-off 提供理论保障
]

#cventry(
  //   tl: `[Valve],
  tl: [Verilog 静态分析技术研究],
  tr: [#link("https://pldi26.sigplan.org/details/pldi-2026-papers/57/Exploiting-Sophisticated-Static-Analysis-for-Verilog")[PLDI 2026] (*CCF-A*), *三作*],
  //   br: [#link("https://vide.pascal-lab.net")[VIDE]],
)[
  - 为硬件描述语言 Verilog 构建支持复杂静态程序分析的开源分析框架
  - 实现*复位*分析、*区间*分析、*信息流*分析等关键算法, 以支持*锁存器*推断、*时钟*推断、*安全性*分析等关键应用
  - 在 11 个开源 Verilog 项目中找到了 18 个真实漏洞/设计缺陷 (9 个为*首次*发现)
]

#cventry(
  //   tl: `[Valve],
  tl: [Verilog 形式化语义研究 (Best Artifact Award)],
  tr: [#link("https://2023.splashcon.org/details/splash-2023-oopsla/40/The-Essence-of-Verilog-A-Tractable-and-Tested-Operational-Semantics-for-Verilog")[OOPSLA 2023] (*CCF-A*), *三作*],
  //   br: [#link("https://vide.pascal-lab.net")[VIDE]],
)[
  - 对硬件描述语言 Verilog 的语义 (IEEE 1364-2005) 进行形式化*理论建模*, 整理为基于*小步操作语义*的执行规则
  - 实现基于小步操作语义的*解释器*和*符号执行*工具 (Symbolic Executor)
  // - 在 800+ 测试程序集上找到 3 种开源 Verilog 仿真器中的*真实语义 bug*
]


== #fa[#project-diagram] 开源项目

  - #ghrepo("pascal-lab/Tai-e"), 静态程序分析框架.
    优化 pointer analysis 性能热点, 设计专用数据结构实现 30% 加速;
    参与并行化分析算法设计与实现, 设计启发式负载估计以优化工作调度, 实现 16 核下加速 8 倍
  - #iconlink(
      "https://github.com/llvm/llvm-project/pulls?q=is%3Apr+author%3Ajjppp",
      label: [#text(fill: rgb(70, 70, 70))[llvm]/#text(weight: "semibold")[llvm-project]],
      icon: github,
    ), 编译器中端优化/基础设施.
    改进 vector-combine 对等价 reduction chains 的识别算法, 设计 vector lanes 上的等价关系, 使得更多 horizontal reductions 可被向量化折叠;
    为 inst-combine 增加 `fpow` fast-math 优化, 在 llvm IR 层面解决代码生成问题;
    修复 7 项优化/代码生成正确性问题
  - #iconlink(
      "https://github.com/tile-ai/tilelang/pulls?q=is%3Apr+author%3Ajjppp",
      label: [#text(fill: rgb(70, 70, 70))[tile-ai]/#text(weight: "semibold")[tilelang]],
      icon: github,
    )
    定位并修复多项编译正确性问题，包括 divergent flow 下的 masked warp synchronization,
    sm_80+ int64/uint64 warp reduction 的 32-bit truncation,
    以及 vectorized bool codegen 等

#cventry(
  tl: [C 优化编译器],
  tr: [#ghrepo("jjppp/cmm")],
)[
  - 实现 C 语言子集编译器, 支持函数调用、循环、结构化数据 (struct/union/array)
  - 参考 LLVM, 实现了 PassManager、RewriterMatcher 等基础设施, 支持添加和管理拥有复杂依赖的 pass 并迭代至不动点
  - 实现*常量传播*、*循环不变量外提*、*归纳变量消除*等复杂编译优化
]

== #fa[#laptop.code] 专业技能

#grid(
  columns: (auto, auto),
  align: (right, left),
  row-gutter: 11pt,
  gutter: 8pt,
  [*编程语言*], [能力不局限于特定编程语言。熟悉 C, C++, Java, Python, Verilog; 学习并使用过 Rust, Haskell, Coq 等],

  // [*程序分析/编译*],
  // [
  //   - (*程序语言*)面向对象、函数式、硬件描述语言等多范式语言的编译和解释执行;
  //   - (*程序分析*)基于*数据流框架*和 *逻辑编程* 的程序分析框架; 熟悉 Tai-e、Datalog 等分析器架构;
  //   - (*编译优化*)编译器中端、后端的分析和优化, 包括 Mem2Reg, VectorCombine, List Scheduling 等; 熟悉 *LLVM* 上的分析优化实现, 熟悉 LLVM-IR 与 MLIR;
  // ],

  [*系统与工具*], [Linux, Git, GDB, perf, Docker; 使用生成式 AI 工具提高效率],
)

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
  硕士, 计算机科学与技术｜#link("https://pascal-lab.net")[PASCAL Lab], 导师：李#redact(mark: true)[樾]｜研究方向为*程序语言*与*程序分析*。 #linebreak()
  助教工作: 计算机程序的构造和解释 (SICP/CS61a, *Python/Scheme*, 2024 秋、2025 秋)
]
#cventry(
  tl: [南京大学],
  tr: [2020.09 - 2024.06],
)[
  本科, 信息与计算科学 (强基计划) | GPA: 4.54/5.00. #linebreak()
  *优秀毕业生* / *基础学科专项奖学金* / ICPC 2021 区域赛*银牌*等
]

== #fa[#briefcase] 工作经历

#cventry(
  tl: [深度求索 (DeepSeek)],
  bl: [系统组],
  br: [线上核心服务实习生 (Rust)],
  tr: [2026.07 - 至今],
)[
  - 负责为线上 chat 服务添加搜索功能后端支持
]

#cventry(
  tl: [平头哥 (阿里巴巴）],
  bl: [编译优化组],
  br: [ai 编译优化实习生],
  tr: [2026.05 - 2026.06],
)[
  - 为 triton 实现 TTGIR 上的分析、优化算法, 以指导后续高效代码生成
    - 改进 TTGIR 上的区间分析算法 (Range Analysis), 针对比特值和数值两种应用场景设计了区间编码方案, 以实现精确区间分析
    - 参与 triton MLIR 编译后端维护, 修复一个 RemoveDeadValues 优化 pass 的 bug
  //   - 主导了 NVIDIA GPU 图形编译器与 NVVM 的访存指令 *vectorizer* 的合并, 旨在对齐 LLVM 上游并降低维护开销：
  //     - 为了支持图形访存指令, 独立设计了*多地址图形访存指令*的编码方案, 以复用 LLVM 访存向量化器的核心流程;
  //     - 为图形指令添加 alias analysis 的支持, 深入分析 BasicAA 和 SCEVAA 以支持新 intrinsics;
  //     - 改进了 LLVM 的 alignment inference 算法, 通过对 SCEV 求解最大公约数, 以支持对循环迭代变量的对齐推断;
  //     - 实现了*十余个*图形访存指令向量化相关*优化*, 包括*非规则访存序列填充*等, 将向量化成功率提升了 *40%*;
]
== #fa[#file] 学术论文

#cventry(
  //   tl: `[Valve],
  tl: [别名分析加速技术研究],
  tr: [OOPSLA 2026 (*CCF-A*, 程序分析顶会), *第一作者*],
  //   br: [#link("https://vide.pascal-lab.net")[VIDE]],
)[
  - 从*堆抽象技术*出发, 为别名分析 (Alias Analysis) 进行加速, 旨在为*编译器*、*程序分析器*等提供更高效的别名分析能力
  - 达到*学术界先进水平*: 获得*平均 40x 加速*, 精度仅丢失 0.4%, 在*函数内联*、*逃逸分析*、*副作用分析*等6项指标上优于已有最先进算法
  - 为加速技术提供*理论精度保障*, 使得速度提升不会显著影响别名分析精度
]

#cventry(
  //   tl: `[Valve],
  tl: [硬件程序分析技术研究],
  tr: [PLDI 2026 (*CCF-A*, 程序语言顶会), *共同作者*],
  //   br: [#link("https://vide.pascal-lab.net")[VIDE]],
)[
  - 第一个支持复杂静态程序分析的开源 Verilog 分析框架
  - 实现*复位*分析、*时序*分析、*信息流*分析等关键算法, 以支持*锁存器*推断、*时钟*推断、*安全性*分析等关键应用
  - 在 11 个开源 Verilog 项目中找到了 18 个真实漏洞 (9 个为*首次*发现)
]

#cventry(
  //   tl: `[Valve],
  tl: [Verilog 形式化语义研究 (Best Artifact Award)],
  tr: [OOPSLA 2023 (*CCF-A*, 程序分析顶会), *共同作者*],
  //   br: [#link("https://vide.pascal-lab.net")[VIDE]],
)[
  - 对硬件描述语言 Verilog 的语义 (IEEE 1364-2005) 进行形式化*理论建模*, 整理为基于*小步操作语义*的执行规则
  - 实现基于小步操作语义的*解释器*和*符号执行*工具 (Symbolic Executor)
  // - 在 800+ 测试程序集上找到 3 种开源 Verilog 仿真器中的*真实语义 bug*
]


== #fa[#project-diagram] 个人项目

#cventry(
  tl: [Cmm],
  tr: [#ghrepo("jjppp/cmm")],
)[
  - 基于图灵完备的 C 语言子集, 支持函数调用、循环、结构化数据 (struct/union/array)
  - 参考 LLVM/CraneLift, 实现了 PassManager、RewriterMatcher 等基础设施, 支持添加和管理拥有复杂依赖的 pass 并迭代至不动点
  - 采用基于 *SSA* 的 IR 设计，实现了*常量传播*、*循环不变量外提*、*归纳变量消除*等复杂编译优化
]

#cventry(
  tl: [#fa[#code.branch] 开源社区贡献],
)[
  - 为 #ghrepo("llvm/llvm-project"), #ghrepo("pytorch/pytorch"), #ghrepo("tile-ai/tilelang") 等知名项目提交共十余个 PR, 更多请见#link("https://github.com/jjppp")[我的 GitHub]
  - 负责维护静态程序分析平台 #ghrepo("pascal-lab/Tai-e"), 参与真实项目的持续迭代演进;
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

  [*开发环境*], [熟悉 NeoVim / VS Code, 习惯在 Linux 下工作; 熟练使用生成式 AI 工具提高效率],
)

	.file "a.pas"
# Begin asmlist al_procedures

.section .text.n_p$exprocedure_$$_sumavg$smallint$smallint$double,"x"
	.balign 16,0x90
.globl	P$EXPROCEDURE_$$_SUMAVG$SMALLINT$SMALLINT$DOUBLE
P$EXPROCEDURE_$$_SUMAVG$SMALLINT$SMALLINT$DOUBLE:
.Lc1:
# Temps allocated between rbp-48 and rbp-28
.seh_proc P$EXPROCEDURE_$$_SUMAVG$SMALLINT$SMALLINT$DOUBLE
# [a.pas]
# [7] begin
	pushq	%rbp
.seh_pushreg %rbp
.Lc3:
.Lc4:
	movq	%rsp,%rbp
.Lc5:
	leaq	-48(%rsp),%rsp
.seh_stackalloc 48
.seh_endprologue
# Var P1 located at rbp-8, size=OS_S16
# Var P2 located at rbp-16, size=OS_S16
# Var Avg located at rbp-24, size=OS_64
# Var s located at rbp-28, size=OS_S16
	movw	%cx,-8(%rbp)
	movw	%dx,-16(%rbp)
	movq	%r8,-24(%rbp)
# [8] s:=P1+P2;
	movswl	-8(%rbp),%edx
	movswl	-16(%rbp),%eax
	leal	(%edx,%eax),%eax
	movw	%ax,-28(%rbp)
# [9] sum:=s;
	movw	-28(%rbp),%ax
	movw	%ax,U_$P$EXPROCEDURE_$$_SUM(%rip)
# [10] Avg:=sum/2;
	movq	-24(%rbp),%rax
	movswl	U_$P$EXPROCEDURE_$$_SUM(%rip),%edx
	cvtsi2sdl	%edx,%xmm0
	mulsd	_$EXPROCEDURE$_Ld1(%rip),%xmm0
	movsd	%xmm0,(%rax)
# [11] end;
	leaq	(%rbp),%rsp
	popq	%rbp
	ret
.seh_endproc
.Lc2:

.section .text.n_main,"x"
	.balign 16,0x90
.globl	PASCALMAIN
PASCALMAIN:
.globl	main
main:
.Lc6:
.seh_proc main
# [12] begin
	pushq	%rbp
.seh_pushreg %rbp
.Lc8:
.Lc9:
	movq	%rsp,%rbp
.Lc10:
	leaq	-32(%rsp),%rsp
.seh_stackalloc 32
.seh_endprologue
	call	fpc_initializeunits
# [13] x:=5;
	movw	$5,U_$P$EXPROCEDURE_$$_X(%rip)
# [14] y:=7;
	movw	$7,U_$P$EXPROCEDURE_$$_Y(%rip)
# [15] SumAvg(x,y,A);
	leaq	U_$P$EXPROCEDURE_$$_A(%rip),%rax
	movswl	U_$P$EXPROCEDURE_$$_Y(%rip),%edx
	movswl	U_$P$EXPROCEDURE_$$_X(%rip),%ecx
	movq	%rax,%r8
	call	P$EXPROCEDURE_$$_SUMAVG$SMALLINT$SMALLINT$DOUBLE
# [16] end.
	call	fpc_do_exit
	nop
	leaq	(%rbp),%rsp
	popq	%rbp
	ret
.seh_endproc
.Lc7:
# End asmlist al_procedures
# Begin asmlist al_globals

.section .bss
	.balign 2
# [3] x,y,sum: integer;
U_$P$EXPROCEDURE_$$_X:
	.zero 2

.section .bss
	.balign 2
U_$P$EXPROCEDURE_$$_Y:
	.zero 2

.section .bss
	.balign 2
U_$P$EXPROCEDURE_$$_SUM:
	.zero 2

.section .bss
	.balign 8
# [4] A: double;
U_$P$EXPROCEDURE_$$_A:
	.zero 8

.section .data.n_INITFINAL,"d"
	.balign 8
.globl	INITFINAL
INITFINAL:
	.quad	2,0
	.quad	INIT$_$SYSTEM
	.quad	0
	.quad	INIT$_$FPINTRES
	.quad	0

.section .data.n_FPC_THREADVARTABLES,"d"
	.balign 8
.globl	FPC_THREADVARTABLES
FPC_THREADVARTABLES:
	.long	1
	.quad	THREADVARLIST_$SYSTEM$indirect

.section .rodata.n_FPC_RESOURCESTRINGTABLES,"d"
	.balign 8
.globl	FPC_RESOURCESTRINGTABLES
FPC_RESOURCESTRINGTABLES:
	.quad	0

.section .data.n_FPC_WIDEINITTABLES,"d"
	.balign 8
.globl	FPC_WIDEINITTABLES
FPC_WIDEINITTABLES:
	.quad	0

.section .data.n_FPC_RESSTRINITTABLES,"d"
	.balign 8
.globl	FPC_RESSTRINITTABLES
FPC_RESSTRINITTABLES:
	.quad	0

.section .fpc.n_version
	.balign 16
__fpc_ident:
	.ascii	"FPC 3.2.0 [2020/06/04] for x86_64 - Win64"

.section .data.n___heapsize,"d"
	.balign 8
.globl	__heapsize
__heapsize:
	.quad	0

.section .data.n___fpc_valgrind,"d"
	.balign 8
.globl	__fpc_valgrind
__fpc_valgrind:
	.byte	0
# End asmlist al_globals
# Begin asmlist al_typedconsts

.section .rodata.n__$EXPROCEDURE$_Ld1,"d"
	.balign 8
.globl	_$EXPROCEDURE$_Ld1
_$EXPROCEDURE$_Ld1:
# value: 0d+5.0000000000000000E-001
	.byte	0,0,0,0,0,0,224,63
# End asmlist al_typedconsts
# Begin asmlist al_dwarf_frame

.section .debug_frame
.Lc11:
	.long	.Lc13-.Lc12
.Lc12:
	.long	-1
	.byte	1
	.byte	0
	.uleb128	1
	.sleb128	-4
	.byte	16
	.byte	12
	.uleb128	7
	.uleb128	8
	.byte	5
	.uleb128	16
	.uleb128	2
	.balign 4,0
.Lc13:
	.long	.Lc15-.Lc14
.Lc14:
	.secrel32	.Lc11
	.quad	.Lc1
	.quad	.Lc2-.Lc1
	.byte	4
	.long	.Lc3-.Lc1
	.byte	14
	.uleb128	16
	.byte	4
	.long	.Lc4-.Lc3
	.byte	5
	.uleb128	6
	.uleb128	4
	.byte	4
	.long	.Lc5-.Lc4
	.byte	13
	.uleb128	6
	.balign 4,0
.Lc15:
	.long	.Lc17-.Lc16
.Lc16:
	.secrel32	.Lc11
	.quad	.Lc6
	.quad	.Lc7-.Lc6
	.byte	4
	.long	.Lc8-.Lc6
	.byte	14
	.uleb128	16
	.byte	4
	.long	.Lc9-.Lc8
	.byte	5
	.uleb128	6
	.uleb128	4
	.byte	4
	.long	.Lc10-.Lc9
	.byte	13
	.uleb128	6
	.balign 4,0
.Lc17:
# End asmlist al_dwarf_frame


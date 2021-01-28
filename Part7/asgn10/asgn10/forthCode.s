	.file "forthCode.pas"
# Begin asmlist al_procedures

.section .text.n_main,"x"
	.balign 16,0x90
.globl	PASCALMAIN
PASCALMAIN:
.globl	main
main:
.Lc1:
.seh_proc main
# [forthCode.pas]
# [3] begin
	pushq	%rbp
.seh_pushreg %rbp
.Lc3:
.Lc4:
	movq	%rsp,%rbp
.Lc5:
	leaq	-32(%rsp),%rsp
.seh_stackalloc 32
.seh_endprologue
	call	fpc_initializeunits
# [4] x:=6;
	movw	$6,U_$P$HELLOWORLD_$$_X(%rip)
# [5] y:=5;
	movw	$5,U_$P$HELLOWORLD_$$_Y(%rip)
# [6] z:=7;
	movw	$7,U_$P$HELLOWORLD_$$_Z(%rip)
# [7] a:=10;
	movw	$10,U_$P$HELLOWORLD_$$_A(%rip)
# [8] while (x=5) and (y>6) or (z<7) and (a=2) do
	jmp	.Lj4
	.balign 8,0x90
.Lj3:
# [10] b:=33;
	movw	$33,U_$P$HELLOWORLD_$$_B(%rip)
.Lj4:
	cmpw	$5,U_$P$HELLOWORLD_$$_X(%rip)
	je	.Lj6
	jmp	.Lj7
.Lj6:
	cmpw	$6,U_$P$HELLOWORLD_$$_Y(%rip)
	jg	.Lj8
	jmp	.Lj7
.Lj7:
	cmpw	$7,U_$P$HELLOWORLD_$$_Z(%rip)
	jl	.Lj10
	jmp	.Lj11
.Lj10:
	cmpw	$2,U_$P$HELLOWORLD_$$_A(%rip)
	je	.Lj12
	jmp	.Lj11
.Lj12:
	jmp	.Lj8
.Lj11:
	jmp	.Lj9
.Lj8:
	jmp	.Lj3
.Lj9:
	jmp	.Lj5
.Lj5:
# [12] end.
	call	fpc_do_exit
	nop
	leaq	(%rbp),%rsp
	popq	%rbp
	ret
.seh_endproc
.Lc2:
# End asmlist al_procedures
# Begin asmlist al_globals

.section .bss
	.balign 2
# [2] var x,y,z,a,b,c : integer;
U_$P$HELLOWORLD_$$_X:
	.zero 2

.section .bss
	.balign 2
U_$P$HELLOWORLD_$$_Y:
	.zero 2

.section .bss
	.balign 2
U_$P$HELLOWORLD_$$_Z:
	.zero 2

.section .bss
	.balign 2
U_$P$HELLOWORLD_$$_A:
	.zero 2

.section .bss
	.balign 2
U_$P$HELLOWORLD_$$_B:
	.zero 2

.section .bss
	.balign 2
U_$P$HELLOWORLD_$$_C:
	.zero 2

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
# Begin asmlist al_dwarf_frame

.section .debug_frame
.Lc6:
	.long	.Lc8-.Lc7
.Lc7:
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
.Lc8:
	.long	.Lc10-.Lc9
.Lc9:
	.secrel32	.Lc6
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
.Lc10:
# End asmlist al_dwarf_frame


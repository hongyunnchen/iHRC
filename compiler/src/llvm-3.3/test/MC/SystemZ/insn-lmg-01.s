# RUN: llvm-mc -triple s390x-linux-gnu -show-encoding %s | FileCheck %s

#CHECK: lmg	%r0, %r0, 0             # encoding: [0xeb,0x00,0x00,0x00,0x00,0x04]
#CHECK: lmg	%r0, %r15, 0            # encoding: [0xeb,0x0f,0x00,0x00,0x00,0x04]
#CHECK: lmg	%r14, %r15, 0           # encoding: [0xeb,0xef,0x00,0x00,0x00,0x04]
#CHECK: lmg	%r15, %r15, 0           # encoding: [0xeb,0xff,0x00,0x00,0x00,0x04]
#CHECK: lmg	%r0, %r0, -524288       # encoding: [0xeb,0x00,0x00,0x00,0x80,0x04]
#CHECK: lmg	%r0, %r0, -1            # encoding: [0xeb,0x00,0x0f,0xff,0xff,0x04]
#CHECK: lmg	%r0, %r0, 0             # encoding: [0xeb,0x00,0x00,0x00,0x00,0x04]
#CHECK: lmg	%r0, %r0, 1             # encoding: [0xeb,0x00,0x00,0x01,0x00,0x04]
#CHECK: lmg	%r0, %r0, 524287        # encoding: [0xeb,0x00,0x0f,0xff,0x7f,0x04]
#CHECK: lmg	%r0, %r0, 0(%r1)        # encoding: [0xeb,0x00,0x10,0x00,0x00,0x04]
#CHECK: lmg	%r0, %r0, 0(%r15)       # encoding: [0xeb,0x00,0xf0,0x00,0x00,0x04]
#CHECK: lmg	%r0, %r0, 524287(%r1)   # encoding: [0xeb,0x00,0x1f,0xff,0x7f,0x04]
#CHECK: lmg	%r0, %r0, 524287(%r15)  # encoding: [0xeb,0x00,0xff,0xff,0x7f,0x04]

	lmg	%r0,%r0,0
	lmg	%r0,%r15,0
	lmg	%r14,%r15,0
	lmg	%r15,%r15,0
	lmg	%r0,%r0,-524288
	lmg	%r0,%r0,-1
	lmg	%r0,%r0,0
	lmg	%r0,%r0,1
	lmg	%r0,%r0,524287
	lmg	%r0,%r0,0(%r1)
	lmg	%r0,%r0,0(%r15)
	lmg	%r0,%r0,524287(%r1)
	lmg	%r0,%r0,524287(%r15)

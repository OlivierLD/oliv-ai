ке
К №
:
Add
x"T
y"T
z"T"
Ttype:
2	
W
AddN
inputs"T*N
sum"T"
Nint(0"!
Ttype:
2	АР
Ы
ArgMax

input"T
	dimension"Tidx
output"output_type" 
Ttype:
2	"
Tidxtype0:
2	"
output_typetype0	:
2	
E
AssignAddVariableOp
resource
value"dtype"
dtypetypeИ
B
AssignVariableOp
resource
value"dtype"
dtypetypeИ
~
BiasAdd

value"T	
bias"T
output"T" 
Ttype:
2	"-
data_formatstringNHWC:
NHWCNCHW
~
BiasAddGrad
out_backprop"T
output"T" 
Ttype:
2	"-
data_formatstringNHWC:
NHWCNCHW
R
BroadcastGradientArgs
s0"T
s1"T
r0"T
r1"T"
Ttype0:
2	
N
Cast	
x"SrcT	
y"DstT"
SrcTtype"
DstTtype"
Truncatebool( 
8
Const
output"dtype"
valuetensor"
dtypetype
8
DivNoNan
x"T
y"T
z"T"
Ttype:	
2
B
Equal
x"T
y"T
z
"
Ttype:
2	
Р
W

ExpandDims

input"T
dim"Tdim
output"T"	
Ttype"
Tdimtype0:
2	
^
Fill
dims"
index_type

value"T
output"T"	
Ttype"

index_typetype0:
2	
.
Identity

input"T
output"T"	
Ttype
q
MatMul
a"T
b"T
product"T"
transpose_abool( "
transpose_bbool( "
Ttype:

2	
e
MergeV2Checkpoints
checkpoint_prefixes
destination_prefix"
delete_old_dirsbool(И
=
Mul
x"T
y"T
z"T"
Ttype:
2	Р
.
Neg
x"T
y"T"
Ttype:

2	

NoOp
M
Pack
values"T*N
output"T"
Nint(0"	
Ttype"
axisint 
C
Placeholder
output"dtype"
dtypetype"
shapeshape:
X
PlaceholderWithDefault
input"dtype
output"dtype"
dtypetype"
shapeshape
6
Pow
x"T
y"T
z"T"
Ttype:

2	
L
PreventGradient

input"T
output"T"	
Ttype"
messagestring 
~
RandomUniform

shape"T
output"dtype"
seedint "
seed2int "
dtypetype:
2"
Ttype:
2	И
@
ReadVariableOp
resource
value"dtype"
dtypetypeИ
E
Relu
features"T
activations"T"
Ttype:
2	
V
ReluGrad
	gradients"T
features"T
	backprops"T"
Ttype:
2	
[
Reshape
tensor"T
shape"Tshape
output"T"	
Ttype"
Tshapetype0:
2	
а
ResourceApplyAdam
var
m
v
beta1_power"T
beta2_power"T
lr"T

beta1"T

beta2"T
epsilon"T	
grad"T" 
Ttype:
2	"
use_lockingbool( "
use_nesterovbool( И
o
	RestoreV2

prefix
tensor_names
shape_and_slices
tensors2dtypes"
dtypes
list(type)(0И
.
Rsqrt
x"T
y"T"
Ttype:

2
l
SaveV2

prefix
tensor_names
shape_and_slices
tensors2dtypes"
dtypes
list(type)(0И
P
Shape

input"T
output"out_type"	
Ttype"
out_typetype0:
2	
H
ShardedFilename
basename	
shard

num_shards
filename
O
Size

input"T
output"out_type"	
Ttype"
out_typetype0:
2	
9
Softmax
logits"T
softmax"T"
Ttype:
2
У
#SparseSoftmaxCrossEntropyWithLogits
features"T
labels"Tlabels	
loss"T
backprop"T"
Ttype:
2"
Tlabelstype0	:
2	
N
Squeeze

input"T
output"T"	
Ttype"
squeeze_dims	list(int)
 (
N

StringJoin
inputs*N

output"
Nint(0"
	separatorstring 
:
Sub
x"T
y"T
z"T"
Ttype:
2	
М
Sum

input"T
reduction_indices"Tidx
output"T"
	keep_dimsbool( " 
Ttype:
2	"
Tidxtype0:
2	
c
Tile

input"T
	multiples"
Tmultiples
output"T"	
Ttype"

Tmultiplestype0:
2	
q
VarHandleOp
resource"
	containerstring "
shared_namestring "
dtypetype"
shapeshapeИ
9
VarIsInitializedOp
resource
is_initialized
И
&
	ZerosLike
x"T
y"T"	
Ttype"serve*1.14.02v1.14.0-rc1-22-gaf24dc91b5ГЕ
v
Hidden1Layer1_inputPlaceholder*
dtype0*'
_output_shapes
:€€€€€€€€€*
shape:€€€€€€€€€
ѓ
5Hidden1Layer1/kernel/Initializer/random_uniform/shapeConst*
valueB"   d   *'
_class
loc:@Hidden1Layer1/kernel*
dtype0*
_output_shapes
:
°
3Hidden1Layer1/kernel/Initializer/random_uniform/minConst*
dtype0*
_output_shapes
: *
valueB
 *ё%wЊ*'
_class
loc:@Hidden1Layer1/kernel
°
3Hidden1Layer1/kernel/Initializer/random_uniform/maxConst*
valueB
 *ё%w>*'
_class
loc:@Hidden1Layer1/kernel*
dtype0*
_output_shapes
: 
э
=Hidden1Layer1/kernel/Initializer/random_uniform/RandomUniformRandomUniform5Hidden1Layer1/kernel/Initializer/random_uniform/shape*
seed2 *
dtype0*
_output_shapes

:d*

seed *
T0*'
_class
loc:@Hidden1Layer1/kernel
о
3Hidden1Layer1/kernel/Initializer/random_uniform/subSub3Hidden1Layer1/kernel/Initializer/random_uniform/max3Hidden1Layer1/kernel/Initializer/random_uniform/min*'
_class
loc:@Hidden1Layer1/kernel*
_output_shapes
: *
T0
А
3Hidden1Layer1/kernel/Initializer/random_uniform/mulMul=Hidden1Layer1/kernel/Initializer/random_uniform/RandomUniform3Hidden1Layer1/kernel/Initializer/random_uniform/sub*
T0*'
_class
loc:@Hidden1Layer1/kernel*
_output_shapes

:d
т
/Hidden1Layer1/kernel/Initializer/random_uniformAdd3Hidden1Layer1/kernel/Initializer/random_uniform/mul3Hidden1Layer1/kernel/Initializer/random_uniform/min*
_output_shapes

:d*
T0*'
_class
loc:@Hidden1Layer1/kernel
Њ
Hidden1Layer1/kernelVarHandleOp*%
shared_nameHidden1Layer1/kernel*'
_class
loc:@Hidden1Layer1/kernel*
	container *
shape
:d*
dtype0*
_output_shapes
: 
y
5Hidden1Layer1/kernel/IsInitialized/VarIsInitializedOpVarIsInitializedOpHidden1Layer1/kernel*
_output_shapes
: 
ђ
Hidden1Layer1/kernel/AssignAssignVariableOpHidden1Layer1/kernel/Hidden1Layer1/kernel/Initializer/random_uniform*'
_class
loc:@Hidden1Layer1/kernel*
dtype0
¶
(Hidden1Layer1/kernel/Read/ReadVariableOpReadVariableOpHidden1Layer1/kernel*'
_class
loc:@Hidden1Layer1/kernel*
dtype0*
_output_shapes

:d
Ш
$Hidden1Layer1/bias/Initializer/zerosConst*
valueBd*    *%
_class
loc:@Hidden1Layer1/bias*
dtype0*
_output_shapes
:d
і
Hidden1Layer1/biasVarHandleOp*
dtype0*
_output_shapes
: *#
shared_nameHidden1Layer1/bias*%
_class
loc:@Hidden1Layer1/bias*
	container *
shape:d
u
3Hidden1Layer1/bias/IsInitialized/VarIsInitializedOpVarIsInitializedOpHidden1Layer1/bias*
_output_shapes
: 
Ы
Hidden1Layer1/bias/AssignAssignVariableOpHidden1Layer1/bias$Hidden1Layer1/bias/Initializer/zeros*%
_class
loc:@Hidden1Layer1/bias*
dtype0
Ь
&Hidden1Layer1/bias/Read/ReadVariableOpReadVariableOpHidden1Layer1/bias*%
_class
loc:@Hidden1Layer1/bias*
dtype0*
_output_shapes
:d
x
#Hidden1Layer1/MatMul/ReadVariableOpReadVariableOpHidden1Layer1/kernel*
dtype0*
_output_shapes

:d
∞
Hidden1Layer1/MatMulMatMulHidden1Layer1_input#Hidden1Layer1/MatMul/ReadVariableOp*
T0*'
_output_shapes
:€€€€€€€€€d*
transpose_a( *
transpose_b( 
s
$Hidden1Layer1/BiasAdd/ReadVariableOpReadVariableOpHidden1Layer1/bias*
dtype0*
_output_shapes
:d
•
Hidden1Layer1/BiasAddBiasAddHidden1Layer1/MatMul$Hidden1Layer1/BiasAdd/ReadVariableOp*
T0*
data_formatNHWC*'
_output_shapes
:€€€€€€€€€d
•
*batch_normalization/gamma/Initializer/onesConst*
valueBd*  А?*,
_class"
 loc:@batch_normalization/gamma*
dtype0*
_output_shapes
:d
…
batch_normalization/gammaVarHandleOp*
dtype0*
_output_shapes
: **
shared_namebatch_normalization/gamma*,
_class"
 loc:@batch_normalization/gamma*
	container *
shape:d
Г
:batch_normalization/gamma/IsInitialized/VarIsInitializedOpVarIsInitializedOpbatch_normalization/gamma*
_output_shapes
: 
ґ
 batch_normalization/gamma/AssignAssignVariableOpbatch_normalization/gamma*batch_normalization/gamma/Initializer/ones*,
_class"
 loc:@batch_normalization/gamma*
dtype0
±
-batch_normalization/gamma/Read/ReadVariableOpReadVariableOpbatch_normalization/gamma*
dtype0*
_output_shapes
:d*,
_class"
 loc:@batch_normalization/gamma
§
*batch_normalization/beta/Initializer/zerosConst*
valueBd*    *+
_class!
loc:@batch_normalization/beta*
dtype0*
_output_shapes
:d
∆
batch_normalization/betaVarHandleOp*)
shared_namebatch_normalization/beta*+
_class!
loc:@batch_normalization/beta*
	container *
shape:d*
dtype0*
_output_shapes
: 
Б
9batch_normalization/beta/IsInitialized/VarIsInitializedOpVarIsInitializedOpbatch_normalization/beta*
_output_shapes
: 
≥
batch_normalization/beta/AssignAssignVariableOpbatch_normalization/beta*batch_normalization/beta/Initializer/zeros*+
_class!
loc:@batch_normalization/beta*
dtype0
Ѓ
,batch_normalization/beta/Read/ReadVariableOpReadVariableOpbatch_normalization/beta*+
_class!
loc:@batch_normalization/beta*
dtype0*
_output_shapes
:d
≤
1batch_normalization/moving_mean/Initializer/zerosConst*
_output_shapes
:d*
valueBd*    *2
_class(
&$loc:@batch_normalization/moving_mean*
dtype0
џ
batch_normalization/moving_meanVarHandleOp*0
shared_name!batch_normalization/moving_mean*2
_class(
&$loc:@batch_normalization/moving_mean*
	container *
shape:d*
dtype0*
_output_shapes
: 
П
@batch_normalization/moving_mean/IsInitialized/VarIsInitializedOpVarIsInitializedOpbatch_normalization/moving_mean*
_output_shapes
: 
ѕ
&batch_normalization/moving_mean/AssignAssignVariableOpbatch_normalization/moving_mean1batch_normalization/moving_mean/Initializer/zeros*2
_class(
&$loc:@batch_normalization/moving_mean*
dtype0
√
3batch_normalization/moving_mean/Read/ReadVariableOpReadVariableOpbatch_normalization/moving_mean*2
_class(
&$loc:@batch_normalization/moving_mean*
dtype0*
_output_shapes
:d
є
4batch_normalization/moving_variance/Initializer/onesConst*
valueBd*  А?*6
_class,
*(loc:@batch_normalization/moving_variance*
dtype0*
_output_shapes
:d
з
#batch_normalization/moving_varianceVarHandleOp*4
shared_name%#batch_normalization/moving_variance*6
_class,
*(loc:@batch_normalization/moving_variance*
	container *
shape:d*
dtype0*
_output_shapes
: 
Ч
Dbatch_normalization/moving_variance/IsInitialized/VarIsInitializedOpVarIsInitializedOp#batch_normalization/moving_variance*
_output_shapes
: 
ё
*batch_normalization/moving_variance/AssignAssignVariableOp#batch_normalization/moving_variance4batch_normalization/moving_variance/Initializer/ones*6
_class,
*(loc:@batch_normalization/moving_variance*
dtype0
ѕ
7batch_normalization/moving_variance/Read/ReadVariableOpReadVariableOp#batch_normalization/moving_variance*6
_class,
*(loc:@batch_normalization/moving_variance*
dtype0*
_output_shapes
:d
М
,batch_normalization/batchnorm/ReadVariableOpReadVariableOp#batch_normalization/moving_variance*
dtype0*
_output_shapes
:d
h
#batch_normalization/batchnorm/add/yConst*
valueB
 *oГ:*
dtype0*
_output_shapes
: 
†
!batch_normalization/batchnorm/addAdd,batch_normalization/batchnorm/ReadVariableOp#batch_normalization/batchnorm/add/y*
T0*
_output_shapes
:d
t
#batch_normalization/batchnorm/RsqrtRsqrt!batch_normalization/batchnorm/add*
T0*
_output_shapes
:d
Ж
0batch_normalization/batchnorm/mul/ReadVariableOpReadVariableOpbatch_normalization/gamma*
dtype0*
_output_shapes
:d
§
!batch_normalization/batchnorm/mulMul#batch_normalization/batchnorm/Rsqrt0batch_normalization/batchnorm/mul/ReadVariableOp*
T0*
_output_shapes
:d
Ц
#batch_normalization/batchnorm/mul_1MulHidden1Layer1/BiasAdd!batch_normalization/batchnorm/mul*
T0*'
_output_shapes
:€€€€€€€€€d
К
.batch_normalization/batchnorm/ReadVariableOp_1ReadVariableOpbatch_normalization/moving_mean*
dtype0*
_output_shapes
:d
Ґ
#batch_normalization/batchnorm/mul_2Mul.batch_normalization/batchnorm/ReadVariableOp_1!batch_normalization/batchnorm/mul*
T0*
_output_shapes
:d
Г
.batch_normalization/batchnorm/ReadVariableOp_2ReadVariableOpbatch_normalization/beta*
dtype0*
_output_shapes
:d
Ґ
!batch_normalization/batchnorm/subSub.batch_normalization/batchnorm/ReadVariableOp_2#batch_normalization/batchnorm/mul_2*
T0*
_output_shapes
:d
§
#batch_normalization/batchnorm/add_1Add#batch_normalization/batchnorm/mul_1!batch_normalization/batchnorm/sub*
T0*'
_output_shapes
:€€€€€€€€€d
n
activation/ReluRelu#batch_normalization/batchnorm/add_1*
T0*'
_output_shapes
:€€€€€€€€€d
_
dropout/IdentityIdentityactivation/Relu*'
_output_shapes
:€€€€€€€€€d*
T0
≠
4HiddenLayer2/kernel/Initializer/random_uniform/shapeConst*
_output_shapes
:*
valueB"d   d   *&
_class
loc:@HiddenLayer2/kernel*
dtype0
Я
2HiddenLayer2/kernel/Initializer/random_uniform/minConst*
valueB
 *ђ\1Њ*&
_class
loc:@HiddenLayer2/kernel*
dtype0*
_output_shapes
: 
Я
2HiddenLayer2/kernel/Initializer/random_uniform/maxConst*
valueB
 *ђ\1>*&
_class
loc:@HiddenLayer2/kernel*
dtype0*
_output_shapes
: 
ъ
<HiddenLayer2/kernel/Initializer/random_uniform/RandomUniformRandomUniform4HiddenLayer2/kernel/Initializer/random_uniform/shape*
dtype0*
_output_shapes

:dd*

seed *
T0*&
_class
loc:@HiddenLayer2/kernel*
seed2 
к
2HiddenLayer2/kernel/Initializer/random_uniform/subSub2HiddenLayer2/kernel/Initializer/random_uniform/max2HiddenLayer2/kernel/Initializer/random_uniform/min*
T0*&
_class
loc:@HiddenLayer2/kernel*
_output_shapes
: 
ь
2HiddenLayer2/kernel/Initializer/random_uniform/mulMul<HiddenLayer2/kernel/Initializer/random_uniform/RandomUniform2HiddenLayer2/kernel/Initializer/random_uniform/sub*
T0*&
_class
loc:@HiddenLayer2/kernel*
_output_shapes

:dd
о
.HiddenLayer2/kernel/Initializer/random_uniformAdd2HiddenLayer2/kernel/Initializer/random_uniform/mul2HiddenLayer2/kernel/Initializer/random_uniform/min*
T0*&
_class
loc:@HiddenLayer2/kernel*
_output_shapes

:dd
ї
HiddenLayer2/kernelVarHandleOp*
dtype0*
_output_shapes
: *$
shared_nameHiddenLayer2/kernel*&
_class
loc:@HiddenLayer2/kernel*
	container *
shape
:dd
w
4HiddenLayer2/kernel/IsInitialized/VarIsInitializedOpVarIsInitializedOpHiddenLayer2/kernel*
_output_shapes
: 
®
HiddenLayer2/kernel/AssignAssignVariableOpHiddenLayer2/kernel.HiddenLayer2/kernel/Initializer/random_uniform*&
_class
loc:@HiddenLayer2/kernel*
dtype0
£
'HiddenLayer2/kernel/Read/ReadVariableOpReadVariableOpHiddenLayer2/kernel*&
_class
loc:@HiddenLayer2/kernel*
dtype0*
_output_shapes

:dd
Ц
#HiddenLayer2/bias/Initializer/zerosConst*
valueBd*    *$
_class
loc:@HiddenLayer2/bias*
dtype0*
_output_shapes
:d
±
HiddenLayer2/biasVarHandleOp*"
shared_nameHiddenLayer2/bias*$
_class
loc:@HiddenLayer2/bias*
	container *
shape:d*
dtype0*
_output_shapes
: 
s
2HiddenLayer2/bias/IsInitialized/VarIsInitializedOpVarIsInitializedOpHiddenLayer2/bias*
_output_shapes
: 
Ч
HiddenLayer2/bias/AssignAssignVariableOpHiddenLayer2/bias#HiddenLayer2/bias/Initializer/zeros*$
_class
loc:@HiddenLayer2/bias*
dtype0
Щ
%HiddenLayer2/bias/Read/ReadVariableOpReadVariableOpHiddenLayer2/bias*$
_class
loc:@HiddenLayer2/bias*
dtype0*
_output_shapes
:d
v
"HiddenLayer2/MatMul/ReadVariableOpReadVariableOpHiddenLayer2/kernel*
dtype0*
_output_shapes

:dd
Ђ
HiddenLayer2/MatMulMatMuldropout/Identity"HiddenLayer2/MatMul/ReadVariableOp*'
_output_shapes
:€€€€€€€€€d*
transpose_a( *
transpose_b( *
T0
q
#HiddenLayer2/BiasAdd/ReadVariableOpReadVariableOpHiddenLayer2/bias*
dtype0*
_output_shapes
:d
Ґ
HiddenLayer2/BiasAddBiasAddHiddenLayer2/MatMul#HiddenLayer2/BiasAdd/ReadVariableOp*
T0*
data_formatNHWC*'
_output_shapes
:€€€€€€€€€d
©
,batch_normalization_1/gamma/Initializer/onesConst*
valueBd*  А?*.
_class$
" loc:@batch_normalization_1/gamma*
dtype0*
_output_shapes
:d
ѕ
batch_normalization_1/gammaVarHandleOp*
dtype0*
_output_shapes
: *,
shared_namebatch_normalization_1/gamma*.
_class$
" loc:@batch_normalization_1/gamma*
	container *
shape:d
З
<batch_normalization_1/gamma/IsInitialized/VarIsInitializedOpVarIsInitializedOpbatch_normalization_1/gamma*
_output_shapes
: 
Њ
"batch_normalization_1/gamma/AssignAssignVariableOpbatch_normalization_1/gamma,batch_normalization_1/gamma/Initializer/ones*.
_class$
" loc:@batch_normalization_1/gamma*
dtype0
Ј
/batch_normalization_1/gamma/Read/ReadVariableOpReadVariableOpbatch_normalization_1/gamma*.
_class$
" loc:@batch_normalization_1/gamma*
dtype0*
_output_shapes
:d
®
,batch_normalization_1/beta/Initializer/zerosConst*
valueBd*    *-
_class#
!loc:@batch_normalization_1/beta*
dtype0*
_output_shapes
:d
ћ
batch_normalization_1/betaVarHandleOp*+
shared_namebatch_normalization_1/beta*-
_class#
!loc:@batch_normalization_1/beta*
	container *
shape:d*
dtype0*
_output_shapes
: 
Е
;batch_normalization_1/beta/IsInitialized/VarIsInitializedOpVarIsInitializedOpbatch_normalization_1/beta*
_output_shapes
: 
ї
!batch_normalization_1/beta/AssignAssignVariableOpbatch_normalization_1/beta,batch_normalization_1/beta/Initializer/zeros*-
_class#
!loc:@batch_normalization_1/beta*
dtype0
і
.batch_normalization_1/beta/Read/ReadVariableOpReadVariableOpbatch_normalization_1/beta*-
_class#
!loc:@batch_normalization_1/beta*
dtype0*
_output_shapes
:d
ґ
3batch_normalization_1/moving_mean/Initializer/zerosConst*
dtype0*
_output_shapes
:d*
valueBd*    *4
_class*
(&loc:@batch_normalization_1/moving_mean
б
!batch_normalization_1/moving_meanVarHandleOp*2
shared_name#!batch_normalization_1/moving_mean*4
_class*
(&loc:@batch_normalization_1/moving_mean*
	container *
shape:d*
dtype0*
_output_shapes
: 
У
Bbatch_normalization_1/moving_mean/IsInitialized/VarIsInitializedOpVarIsInitializedOp!batch_normalization_1/moving_mean*
_output_shapes
: 
„
(batch_normalization_1/moving_mean/AssignAssignVariableOp!batch_normalization_1/moving_mean3batch_normalization_1/moving_mean/Initializer/zeros*4
_class*
(&loc:@batch_normalization_1/moving_mean*
dtype0
…
5batch_normalization_1/moving_mean/Read/ReadVariableOpReadVariableOp!batch_normalization_1/moving_mean*4
_class*
(&loc:@batch_normalization_1/moving_mean*
dtype0*
_output_shapes
:d
љ
6batch_normalization_1/moving_variance/Initializer/onesConst*
valueBd*  А?*8
_class.
,*loc:@batch_normalization_1/moving_variance*
dtype0*
_output_shapes
:d
н
%batch_normalization_1/moving_varianceVarHandleOp*
dtype0*
_output_shapes
: *6
shared_name'%batch_normalization_1/moving_variance*8
_class.
,*loc:@batch_normalization_1/moving_variance*
	container *
shape:d
Ы
Fbatch_normalization_1/moving_variance/IsInitialized/VarIsInitializedOpVarIsInitializedOp%batch_normalization_1/moving_variance*
_output_shapes
: 
ж
,batch_normalization_1/moving_variance/AssignAssignVariableOp%batch_normalization_1/moving_variance6batch_normalization_1/moving_variance/Initializer/ones*8
_class.
,*loc:@batch_normalization_1/moving_variance*
dtype0
’
9batch_normalization_1/moving_variance/Read/ReadVariableOpReadVariableOp%batch_normalization_1/moving_variance*8
_class.
,*loc:@batch_normalization_1/moving_variance*
dtype0*
_output_shapes
:d
Р
.batch_normalization_1/batchnorm/ReadVariableOpReadVariableOp%batch_normalization_1/moving_variance*
dtype0*
_output_shapes
:d
j
%batch_normalization_1/batchnorm/add/yConst*
valueB
 *oГ:*
dtype0*
_output_shapes
: 
¶
#batch_normalization_1/batchnorm/addAdd.batch_normalization_1/batchnorm/ReadVariableOp%batch_normalization_1/batchnorm/add/y*
T0*
_output_shapes
:d
x
%batch_normalization_1/batchnorm/RsqrtRsqrt#batch_normalization_1/batchnorm/add*
_output_shapes
:d*
T0
К
2batch_normalization_1/batchnorm/mul/ReadVariableOpReadVariableOpbatch_normalization_1/gamma*
dtype0*
_output_shapes
:d
™
#batch_normalization_1/batchnorm/mulMul%batch_normalization_1/batchnorm/Rsqrt2batch_normalization_1/batchnorm/mul/ReadVariableOp*
T0*
_output_shapes
:d
Щ
%batch_normalization_1/batchnorm/mul_1MulHiddenLayer2/BiasAdd#batch_normalization_1/batchnorm/mul*
T0*'
_output_shapes
:€€€€€€€€€d
О
0batch_normalization_1/batchnorm/ReadVariableOp_1ReadVariableOp!batch_normalization_1/moving_mean*
dtype0*
_output_shapes
:d
®
%batch_normalization_1/batchnorm/mul_2Mul0batch_normalization_1/batchnorm/ReadVariableOp_1#batch_normalization_1/batchnorm/mul*
T0*
_output_shapes
:d
З
0batch_normalization_1/batchnorm/ReadVariableOp_2ReadVariableOpbatch_normalization_1/beta*
dtype0*
_output_shapes
:d
®
#batch_normalization_1/batchnorm/subSub0batch_normalization_1/batchnorm/ReadVariableOp_2%batch_normalization_1/batchnorm/mul_2*
_output_shapes
:d*
T0
™
%batch_normalization_1/batchnorm/add_1Add%batch_normalization_1/batchnorm/mul_1#batch_normalization_1/batchnorm/sub*'
_output_shapes
:€€€€€€€€€d*
T0
r
activation_1/ReluRelu%batch_normalization_1/batchnorm/add_1*
T0*'
_output_shapes
:€€€€€€€€€d
c
dropout_1/IdentityIdentityactivation_1/Relu*
T0*'
_output_shapes
:€€€€€€€€€d
≠
4SoftmaxLayer/kernel/Initializer/random_uniform/shapeConst*
_output_shapes
:*
valueB"d      *&
_class
loc:@SoftmaxLayer/kernel*
dtype0
Я
2SoftmaxLayer/kernel/Initializer/random_uniform/minConst*
valueB
 *ё%wЊ*&
_class
loc:@SoftmaxLayer/kernel*
dtype0*
_output_shapes
: 
Я
2SoftmaxLayer/kernel/Initializer/random_uniform/maxConst*
valueB
 *ё%w>*&
_class
loc:@SoftmaxLayer/kernel*
dtype0*
_output_shapes
: 
ъ
<SoftmaxLayer/kernel/Initializer/random_uniform/RandomUniformRandomUniform4SoftmaxLayer/kernel/Initializer/random_uniform/shape*
dtype0*
_output_shapes

:d*

seed *
T0*&
_class
loc:@SoftmaxLayer/kernel*
seed2 
к
2SoftmaxLayer/kernel/Initializer/random_uniform/subSub2SoftmaxLayer/kernel/Initializer/random_uniform/max2SoftmaxLayer/kernel/Initializer/random_uniform/min*
T0*&
_class
loc:@SoftmaxLayer/kernel*
_output_shapes
: 
ь
2SoftmaxLayer/kernel/Initializer/random_uniform/mulMul<SoftmaxLayer/kernel/Initializer/random_uniform/RandomUniform2SoftmaxLayer/kernel/Initializer/random_uniform/sub*
_output_shapes

:d*
T0*&
_class
loc:@SoftmaxLayer/kernel
о
.SoftmaxLayer/kernel/Initializer/random_uniformAdd2SoftmaxLayer/kernel/Initializer/random_uniform/mul2SoftmaxLayer/kernel/Initializer/random_uniform/min*
T0*&
_class
loc:@SoftmaxLayer/kernel*
_output_shapes

:d
ї
SoftmaxLayer/kernelVarHandleOp*&
_class
loc:@SoftmaxLayer/kernel*
	container *
shape
:d*
dtype0*
_output_shapes
: *$
shared_nameSoftmaxLayer/kernel
w
4SoftmaxLayer/kernel/IsInitialized/VarIsInitializedOpVarIsInitializedOpSoftmaxLayer/kernel*
_output_shapes
: 
®
SoftmaxLayer/kernel/AssignAssignVariableOpSoftmaxLayer/kernel.SoftmaxLayer/kernel/Initializer/random_uniform*&
_class
loc:@SoftmaxLayer/kernel*
dtype0
£
'SoftmaxLayer/kernel/Read/ReadVariableOpReadVariableOpSoftmaxLayer/kernel*
dtype0*
_output_shapes

:d*&
_class
loc:@SoftmaxLayer/kernel
Ц
#SoftmaxLayer/bias/Initializer/zerosConst*
valueB*    *$
_class
loc:@SoftmaxLayer/bias*
dtype0*
_output_shapes
:
±
SoftmaxLayer/biasVarHandleOp*"
shared_nameSoftmaxLayer/bias*$
_class
loc:@SoftmaxLayer/bias*
	container *
shape:*
dtype0*
_output_shapes
: 
s
2SoftmaxLayer/bias/IsInitialized/VarIsInitializedOpVarIsInitializedOpSoftmaxLayer/bias*
_output_shapes
: 
Ч
SoftmaxLayer/bias/AssignAssignVariableOpSoftmaxLayer/bias#SoftmaxLayer/bias/Initializer/zeros*$
_class
loc:@SoftmaxLayer/bias*
dtype0
Щ
%SoftmaxLayer/bias/Read/ReadVariableOpReadVariableOpSoftmaxLayer/bias*$
_class
loc:@SoftmaxLayer/bias*
dtype0*
_output_shapes
:
v
"SoftmaxLayer/MatMul/ReadVariableOpReadVariableOpSoftmaxLayer/kernel*
dtype0*
_output_shapes

:d
≠
SoftmaxLayer/MatMulMatMuldropout_1/Identity"SoftmaxLayer/MatMul/ReadVariableOp*'
_output_shapes
:€€€€€€€€€*
transpose_a( *
transpose_b( *
T0
q
#SoftmaxLayer/BiasAdd/ReadVariableOpReadVariableOpSoftmaxLayer/bias*
_output_shapes
:*
dtype0
Ґ
SoftmaxLayer/BiasAddBiasAddSoftmaxLayer/MatMul#SoftmaxLayer/BiasAdd/ReadVariableOp*
T0*
data_formatNHWC*'
_output_shapes
:€€€€€€€€€
g
SoftmaxLayer/SoftmaxSoftmaxSoftmaxLayer/BiasAdd*'
_output_shapes
:€€€€€€€€€*
T0
\
PlaceholderPlaceholder*
dtype0*
_output_shapes

:d*
shape
:d
T
AssignVariableOpAssignVariableOpHidden1Layer1/kernelPlaceholder*
dtype0
v
ReadVariableOpReadVariableOpHidden1Layer1/kernel^AssignVariableOp*
dtype0*
_output_shapes

:d
V
Placeholder_1Placeholder*
dtype0*
_output_shapes
:d*
shape:d
V
AssignVariableOp_1AssignVariableOpHidden1Layer1/biasPlaceholder_1*
dtype0
t
ReadVariableOp_1ReadVariableOpHidden1Layer1/bias^AssignVariableOp_1*
_output_shapes
:d*
dtype0
V
Placeholder_2Placeholder*
shape:d*
dtype0*
_output_shapes
:d
]
AssignVariableOp_2AssignVariableOpbatch_normalization/gammaPlaceholder_2*
dtype0
{
ReadVariableOp_2ReadVariableOpbatch_normalization/gamma^AssignVariableOp_2*
dtype0*
_output_shapes
:d
V
Placeholder_3Placeholder*
_output_shapes
:d*
shape:d*
dtype0
\
AssignVariableOp_3AssignVariableOpbatch_normalization/betaPlaceholder_3*
dtype0
z
ReadVariableOp_3ReadVariableOpbatch_normalization/beta^AssignVariableOp_3*
dtype0*
_output_shapes
:d
V
Placeholder_4Placeholder*
_output_shapes
:d*
shape:d*
dtype0
c
AssignVariableOp_4AssignVariableOpbatch_normalization/moving_meanPlaceholder_4*
dtype0
Б
ReadVariableOp_4ReadVariableOpbatch_normalization/moving_mean^AssignVariableOp_4*
dtype0*
_output_shapes
:d
V
Placeholder_5Placeholder*
shape:d*
dtype0*
_output_shapes
:d
g
AssignVariableOp_5AssignVariableOp#batch_normalization/moving_variancePlaceholder_5*
dtype0
Е
ReadVariableOp_5ReadVariableOp#batch_normalization/moving_variance^AssignVariableOp_5*
dtype0*
_output_shapes
:d
^
Placeholder_6Placeholder*
dtype0*
_output_shapes

:dd*
shape
:dd
W
AssignVariableOp_6AssignVariableOpHiddenLayer2/kernelPlaceholder_6*
dtype0
y
ReadVariableOp_6ReadVariableOpHiddenLayer2/kernel^AssignVariableOp_6*
dtype0*
_output_shapes

:dd
V
Placeholder_7Placeholder*
dtype0*
_output_shapes
:d*
shape:d
U
AssignVariableOp_7AssignVariableOpHiddenLayer2/biasPlaceholder_7*
dtype0
s
ReadVariableOp_7ReadVariableOpHiddenLayer2/bias^AssignVariableOp_7*
dtype0*
_output_shapes
:d
V
Placeholder_8Placeholder*
dtype0*
_output_shapes
:d*
shape:d
_
AssignVariableOp_8AssignVariableOpbatch_normalization_1/gammaPlaceholder_8*
dtype0
}
ReadVariableOp_8ReadVariableOpbatch_normalization_1/gamma^AssignVariableOp_8*
dtype0*
_output_shapes
:d
V
Placeholder_9Placeholder*
shape:d*
dtype0*
_output_shapes
:d
^
AssignVariableOp_9AssignVariableOpbatch_normalization_1/betaPlaceholder_9*
dtype0
|
ReadVariableOp_9ReadVariableOpbatch_normalization_1/beta^AssignVariableOp_9*
dtype0*
_output_shapes
:d
W
Placeholder_10Placeholder*
dtype0*
_output_shapes
:d*
shape:d
g
AssignVariableOp_10AssignVariableOp!batch_normalization_1/moving_meanPlaceholder_10*
dtype0
Е
ReadVariableOp_10ReadVariableOp!batch_normalization_1/moving_mean^AssignVariableOp_10*
dtype0*
_output_shapes
:d
W
Placeholder_11Placeholder*
shape:d*
dtype0*
_output_shapes
:d
k
AssignVariableOp_11AssignVariableOp%batch_normalization_1/moving_variancePlaceholder_11*
dtype0
Й
ReadVariableOp_11ReadVariableOp%batch_normalization_1/moving_variance^AssignVariableOp_11*
dtype0*
_output_shapes
:d
_
Placeholder_12Placeholder*
shape
:d*
dtype0*
_output_shapes

:d
Y
AssignVariableOp_12AssignVariableOpSoftmaxLayer/kernelPlaceholder_12*
dtype0
{
ReadVariableOp_12ReadVariableOpSoftmaxLayer/kernel^AssignVariableOp_12*
dtype0*
_output_shapes

:d
W
Placeholder_13Placeholder*
dtype0*
_output_shapes
:*
shape:
W
AssignVariableOp_13AssignVariableOpSoftmaxLayer/biasPlaceholder_13*
dtype0
u
ReadVariableOp_13ReadVariableOpSoftmaxLayer/bias^AssignVariableOp_13*
_output_shapes
:*
dtype0
a
VarIsInitializedOpVarIsInitializedOpbatch_normalization/moving_mean*
_output_shapes
: 
U
VarIsInitializedOp_1VarIsInitializedOpHiddenLayer2/bias*
_output_shapes
: 
_
VarIsInitializedOp_2VarIsInitializedOpbatch_normalization_1/gamma*
_output_shapes
: 
\
VarIsInitializedOp_3VarIsInitializedOpbatch_normalization/beta*
_output_shapes
: 
W
VarIsInitializedOp_4VarIsInitializedOpHiddenLayer2/kernel*
_output_shapes
: 
g
VarIsInitializedOp_5VarIsInitializedOp#batch_normalization/moving_variance*
_output_shapes
: 
V
VarIsInitializedOp_6VarIsInitializedOpHidden1Layer1/bias*
_output_shapes
: 
i
VarIsInitializedOp_7VarIsInitializedOp%batch_normalization_1/moving_variance*
_output_shapes
: 
U
VarIsInitializedOp_8VarIsInitializedOpSoftmaxLayer/bias*
_output_shapes
: 
e
VarIsInitializedOp_9VarIsInitializedOp!batch_normalization_1/moving_mean*
_output_shapes
: 
X
VarIsInitializedOp_10VarIsInitializedOpSoftmaxLayer/kernel*
_output_shapes
: 
^
VarIsInitializedOp_11VarIsInitializedOpbatch_normalization/gamma*
_output_shapes
: 
Y
VarIsInitializedOp_12VarIsInitializedOpHidden1Layer1/kernel*
_output_shapes
: 
_
VarIsInitializedOp_13VarIsInitializedOpbatch_normalization_1/beta*
_output_shapes
: 
ф
initNoOp^Hidden1Layer1/bias/Assign^Hidden1Layer1/kernel/Assign^HiddenLayer2/bias/Assign^HiddenLayer2/kernel/Assign^SoftmaxLayer/bias/Assign^SoftmaxLayer/kernel/Assign ^batch_normalization/beta/Assign!^batch_normalization/gamma/Assign'^batch_normalization/moving_mean/Assign+^batch_normalization/moving_variance/Assign"^batch_normalization_1/beta/Assign#^batch_normalization_1/gamma/Assign)^batch_normalization_1/moving_mean/Assign-^batch_normalization_1/moving_variance/Assign
И
SoftmaxLayer_targetPlaceholder*0
_output_shapes
:€€€€€€€€€€€€€€€€€€*%
shape:€€€€€€€€€€€€€€€€€€*
dtype0
v
total/Initializer/zerosConst*
valueB
 *    *
_class

loc:@total*
dtype0*
_output_shapes
: 
Й
totalVarHandleOp*
_output_shapes
: *
shared_nametotal*
_class

loc:@total*
	container *
shape: *
dtype0
[
&total/IsInitialized/VarIsInitializedOpVarIsInitializedOptotal*
_output_shapes
: 
g
total/AssignAssignVariableOptotaltotal/Initializer/zeros*
_class

loc:@total*
dtype0
q
total/Read/ReadVariableOpReadVariableOptotal*
_output_shapes
: *
_class

loc:@total*
dtype0
v
count/Initializer/zerosConst*
valueB
 *    *
_class

loc:@count*
dtype0*
_output_shapes
: 
Й
countVarHandleOp*
dtype0*
_output_shapes
: *
shared_namecount*
_class

loc:@count*
	container *
shape: 
[
&count/IsInitialized/VarIsInitializedOpVarIsInitializedOpcount*
_output_shapes
: 
g
count/AssignAssignVariableOpcountcount/Initializer/zeros*
_class

loc:@count*
dtype0
q
count/Read/ReadVariableOpReadVariableOpcount*
_class

loc:@count*
dtype0*
_output_shapes
: 
Б
metrics/acc/SqueezeSqueezeSoftmaxLayer_target*
squeeze_dims

€€€€€€€€€*
T0*#
_output_shapes
:€€€€€€€€€
g
metrics/acc/ArgMax/dimensionConst*
valueB :
€€€€€€€€€*
dtype0*
_output_shapes
: 
Э
metrics/acc/ArgMaxArgMaxSoftmaxLayer/Softmaxmetrics/acc/ArgMax/dimension*
output_type0	*#
_output_shapes
:€€€€€€€€€*

Tidx0*
T0
y
metrics/acc/CastCastmetrics/acc/ArgMax*

SrcT0	*
Truncate( *#
_output_shapes
:€€€€€€€€€*

DstT0
o
metrics/acc/EqualEqualmetrics/acc/Squeezemetrics/acc/Cast*
T0*#
_output_shapes
:€€€€€€€€€
z
metrics/acc/Cast_1Castmetrics/acc/Equal*

SrcT0
*
Truncate( *#
_output_shapes
:€€€€€€€€€*

DstT0
[
metrics/acc/ConstConst*
valueB: *
dtype0*
_output_shapes
:
{
metrics/acc/SumSummetrics/acc/Cast_1metrics/acc/Const*
_output_shapes
: *
	keep_dims( *

Tidx0*
T0
[
metrics/acc/AssignAddVariableOpAssignAddVariableOptotalmetrics/acc/Sum*
dtype0
М
metrics/acc/ReadVariableOpReadVariableOptotal ^metrics/acc/AssignAddVariableOp^metrics/acc/Sum*
dtype0*
_output_shapes
: 
]
metrics/acc/SizeSizemetrics/acc/Cast_1*
T0*
out_type0*
_output_shapes
: 
l
metrics/acc/Cast_2Castmetrics/acc/Size*
_output_shapes
: *

DstT0*

SrcT0*
Truncate( 
В
!metrics/acc/AssignAddVariableOp_1AssignAddVariableOpcountmetrics/acc/Cast_2 ^metrics/acc/AssignAddVariableOp*
dtype0
†
metrics/acc/ReadVariableOp_1ReadVariableOpcount ^metrics/acc/AssignAddVariableOp"^metrics/acc/AssignAddVariableOp_1*
dtype0*
_output_shapes
: 
З
%metrics/acc/div_no_nan/ReadVariableOpReadVariableOptotal"^metrics/acc/AssignAddVariableOp_1*
dtype0*
_output_shapes
: 
Й
'metrics/acc/div_no_nan/ReadVariableOp_1ReadVariableOpcount"^metrics/acc/AssignAddVariableOp_1*
dtype0*
_output_shapes
: 
У
metrics/acc/div_no_nanDivNoNan%metrics/acc/div_no_nan/ReadVariableOp'metrics/acc/div_no_nan/ReadVariableOp_1*
T0*
_output_shapes
: 
Y
metrics/acc/IdentityIdentitymetrics/acc/div_no_nan*
_output_shapes
: *
T0
w
$loss/SoftmaxLayer_loss/Reshape/shapeConst*
valueB:
€€€€€€€€€*
dtype0*
_output_shapes
:
†
loss/SoftmaxLayer_loss/ReshapeReshapeSoftmaxLayer_target$loss/SoftmaxLayer_loss/Reshape/shape*
T0*
Tshape0*#
_output_shapes
:€€€€€€€€€
Р
loss/SoftmaxLayer_loss/CastCastloss/SoftmaxLayer_loss/Reshape*

SrcT0*
Truncate( *#
_output_shapes
:€€€€€€€€€*

DstT0	
w
&loss/SoftmaxLayer_loss/Reshape_1/shapeConst*
valueB"€€€€   *
dtype0*
_output_shapes
:
©
 loss/SoftmaxLayer_loss/Reshape_1ReshapeSoftmaxLayer/BiasAdd&loss/SoftmaxLayer_loss/Reshape_1/shape*
Tshape0*'
_output_shapes
:€€€€€€€€€*
T0
Ы
@loss/SoftmaxLayer_loss/SparseSoftmaxCrossEntropyWithLogits/ShapeShapeloss/SoftmaxLayer_loss/Cast*
T0	*
out_type0*
_output_shapes
:
Ф
^loss/SoftmaxLayer_loss/SparseSoftmaxCrossEntropyWithLogits/SparseSoftmaxCrossEntropyWithLogits#SparseSoftmaxCrossEntropyWithLogits loss/SoftmaxLayer_loss/Reshape_1loss/SoftmaxLayer_loss/Cast*6
_output_shapes$
":€€€€€€€€€:€€€€€€€€€*
Tlabels0	*
T0
o
*loss/SoftmaxLayer_loss/weighted_loss/ConstConst*
valueB
 *  А?*
dtype0*
_output_shapes
: 
Ь
Yloss/SoftmaxLayer_loss/weighted_loss/broadcast_weights/assert_broadcastable/weights/shapeConst*
valueB *
dtype0*
_output_shapes
: 
Ъ
Xloss/SoftmaxLayer_loss/weighted_loss/broadcast_weights/assert_broadcastable/weights/rankConst*
value	B : *
dtype0*
_output_shapes
: 
ц
Xloss/SoftmaxLayer_loss/weighted_loss/broadcast_weights/assert_broadcastable/values/shapeShape^loss/SoftmaxLayer_loss/SparseSoftmaxCrossEntropyWithLogits/SparseSoftmaxCrossEntropyWithLogits*
T0*
out_type0*
_output_shapes
:
Щ
Wloss/SoftmaxLayer_loss/weighted_loss/broadcast_weights/assert_broadcastable/values/rankConst*
value	B :*
dtype0*
_output_shapes
: 
o
gloss/SoftmaxLayer_loss/weighted_loss/broadcast_weights/assert_broadcastable/static_scalar_check_successNoOp
ќ
Floss/SoftmaxLayer_loss/weighted_loss/broadcast_weights/ones_like/ShapeShape^loss/SoftmaxLayer_loss/SparseSoftmaxCrossEntropyWithLogits/SparseSoftmaxCrossEntropyWithLogitsh^loss/SoftmaxLayer_loss/weighted_loss/broadcast_weights/assert_broadcastable/static_scalar_check_success*
T0*
out_type0*
_output_shapes
:
х
Floss/SoftmaxLayer_loss/weighted_loss/broadcast_weights/ones_like/ConstConsth^loss/SoftmaxLayer_loss/weighted_loss/broadcast_weights/assert_broadcastable/static_scalar_check_success*
_output_shapes
: *
valueB
 *  А?*
dtype0
Ш
@loss/SoftmaxLayer_loss/weighted_loss/broadcast_weights/ones_likeFillFloss/SoftmaxLayer_loss/weighted_loss/broadcast_weights/ones_like/ShapeFloss/SoftmaxLayer_loss/weighted_loss/broadcast_weights/ones_like/Const*
T0*

index_type0*#
_output_shapes
:€€€€€€€€€
ў
6loss/SoftmaxLayer_loss/weighted_loss/broadcast_weightsMul*loss/SoftmaxLayer_loss/weighted_loss/Const@loss/SoftmaxLayer_loss/weighted_loss/broadcast_weights/ones_like*
T0*#
_output_shapes
:€€€€€€€€€
х
(loss/SoftmaxLayer_loss/weighted_loss/MulMul^loss/SoftmaxLayer_loss/SparseSoftmaxCrossEntropyWithLogits/SparseSoftmaxCrossEntropyWithLogits6loss/SoftmaxLayer_loss/weighted_loss/broadcast_weights*
T0*#
_output_shapes
:€€€€€€€€€
f
loss/SoftmaxLayer_loss/ConstConst*
valueB: *
dtype0*
_output_shapes
:
І
loss/SoftmaxLayer_loss/SumSum(loss/SoftmaxLayer_loss/weighted_loss/Mulloss/SoftmaxLayer_loss/Const*
T0*
_output_shapes
: *
	keep_dims( *

Tidx0
Ж
#loss/SoftmaxLayer_loss/num_elementsSize(loss/SoftmaxLayer_loss/weighted_loss/Mul*
T0*
out_type0*
_output_shapes
: 
Х
(loss/SoftmaxLayer_loss/num_elements/CastCast#loss/SoftmaxLayer_loss/num_elements*
_output_shapes
: *

DstT0*

SrcT0*
Truncate( 
a
loss/SoftmaxLayer_loss/Const_1Const*
valueB *
dtype0*
_output_shapes
: 
Э
loss/SoftmaxLayer_loss/Sum_1Sumloss/SoftmaxLayer_loss/Sumloss/SoftmaxLayer_loss/Const_1*
T0*
_output_shapes
: *
	keep_dims( *

Tidx0
С
loss/SoftmaxLayer_loss/valueDivNoNanloss/SoftmaxLayer_loss/Sum_1(loss/SoftmaxLayer_loss/num_elements/Cast*
_output_shapes
: *
T0
O

loss/mul/xConst*
valueB
 *  А?*
dtype0*
_output_shapes
: 
Z
loss/mulMul
loss/mul/xloss/SoftmaxLayer_loss/value*
_output_shapes
: *
T0
W
Adam/gradients/ShapeConst*
valueB *
dtype0*
_output_shapes
: 
]
Adam/gradients/grad_ys_0Const*
valueB
 *  А?*
dtype0*
_output_shapes
: 
~
Adam/gradients/FillFillAdam/gradients/ShapeAdam/gradients/grad_ys_0*
T0*

index_type0*
_output_shapes
: 
{
 Adam/gradients/loss/mul_grad/MulMulAdam/gradients/Fillloss/SoftmaxLayer_loss/value*
_output_shapes
: *
T0
k
"Adam/gradients/loss/mul_grad/Mul_1MulAdam/gradients/Fill
loss/mul/x*
_output_shapes
: *
T0
y
6Adam/gradients/loss/SoftmaxLayer_loss/value_grad/ShapeConst*
valueB *
dtype0*
_output_shapes
: 
{
8Adam/gradients/loss/SoftmaxLayer_loss/value_grad/Shape_1Const*
valueB *
dtype0*
_output_shapes
: 
О
FAdam/gradients/loss/SoftmaxLayer_loss/value_grad/BroadcastGradientArgsBroadcastGradientArgs6Adam/gradients/loss/SoftmaxLayer_loss/value_grad/Shape8Adam/gradients/loss/SoftmaxLayer_loss/value_grad/Shape_1*2
_output_shapes 
:€€€€€€€€€:€€€€€€€€€*
T0
ґ
;Adam/gradients/loss/SoftmaxLayer_loss/value_grad/div_no_nanDivNoNan"Adam/gradients/loss/mul_grad/Mul_1(loss/SoftmaxLayer_loss/num_elements/Cast*
_output_shapes
: *
T0
ю
4Adam/gradients/loss/SoftmaxLayer_loss/value_grad/SumSum;Adam/gradients/loss/SoftmaxLayer_loss/value_grad/div_no_nanFAdam/gradients/loss/SoftmaxLayer_loss/value_grad/BroadcastGradientArgs*
_output_shapes
: *
	keep_dims( *

Tidx0*
T0
а
8Adam/gradients/loss/SoftmaxLayer_loss/value_grad/ReshapeReshape4Adam/gradients/loss/SoftmaxLayer_loss/value_grad/Sum6Adam/gradients/loss/SoftmaxLayer_loss/value_grad/Shape*
T0*
Tshape0*
_output_shapes
: 
z
4Adam/gradients/loss/SoftmaxLayer_loss/value_grad/NegNegloss/SoftmaxLayer_loss/Sum_1*
T0*
_output_shapes
: 
 
=Adam/gradients/loss/SoftmaxLayer_loss/value_grad/div_no_nan_1DivNoNan4Adam/gradients/loss/SoftmaxLayer_loss/value_grad/Neg(loss/SoftmaxLayer_loss/num_elements/Cast*
_output_shapes
: *
T0
”
=Adam/gradients/loss/SoftmaxLayer_loss/value_grad/div_no_nan_2DivNoNan=Adam/gradients/loss/SoftmaxLayer_loss/value_grad/div_no_nan_1(loss/SoftmaxLayer_loss/num_elements/Cast*
_output_shapes
: *
T0
њ
4Adam/gradients/loss/SoftmaxLayer_loss/value_grad/mulMul"Adam/gradients/loss/mul_grad/Mul_1=Adam/gradients/loss/SoftmaxLayer_loss/value_grad/div_no_nan_2*
T0*
_output_shapes
: 
ы
6Adam/gradients/loss/SoftmaxLayer_loss/value_grad/Sum_1Sum4Adam/gradients/loss/SoftmaxLayer_loss/value_grad/mulHAdam/gradients/loss/SoftmaxLayer_loss/value_grad/BroadcastGradientArgs:1*
_output_shapes
: *
	keep_dims( *

Tidx0*
T0
ж
:Adam/gradients/loss/SoftmaxLayer_loss/value_grad/Reshape_1Reshape6Adam/gradients/loss/SoftmaxLayer_loss/value_grad/Sum_18Adam/gradients/loss/SoftmaxLayer_loss/value_grad/Shape_1*
T0*
Tshape0*
_output_shapes
: 
Б
>Adam/gradients/loss/SoftmaxLayer_loss/Sum_1_grad/Reshape/shapeConst*
valueB *
dtype0*
_output_shapes
: 
м
8Adam/gradients/loss/SoftmaxLayer_loss/Sum_1_grad/ReshapeReshape8Adam/gradients/loss/SoftmaxLayer_loss/value_grad/Reshape>Adam/gradients/loss/SoftmaxLayer_loss/Sum_1_grad/Reshape/shape*
T0*
Tshape0*
_output_shapes
: 
y
6Adam/gradients/loss/SoftmaxLayer_loss/Sum_1_grad/ConstConst*
valueB *
dtype0*
_output_shapes
: 
в
5Adam/gradients/loss/SoftmaxLayer_loss/Sum_1_grad/TileTile8Adam/gradients/loss/SoftmaxLayer_loss/Sum_1_grad/Reshape6Adam/gradients/loss/SoftmaxLayer_loss/Sum_1_grad/Const*

Tmultiples0*
T0*
_output_shapes
: 
Ж
<Adam/gradients/loss/SoftmaxLayer_loss/Sum_grad/Reshape/shapeConst*
valueB:*
dtype0*
_output_shapes
:
й
6Adam/gradients/loss/SoftmaxLayer_loss/Sum_grad/ReshapeReshape5Adam/gradients/loss/SoftmaxLayer_loss/Sum_1_grad/Tile<Adam/gradients/loss/SoftmaxLayer_loss/Sum_grad/Reshape/shape*
T0*
Tshape0*
_output_shapes
:
Ь
4Adam/gradients/loss/SoftmaxLayer_loss/Sum_grad/ShapeShape(loss/SoftmaxLayer_loss/weighted_loss/Mul*
out_type0*
_output_shapes
:*
T0
й
3Adam/gradients/loss/SoftmaxLayer_loss/Sum_grad/TileTile6Adam/gradients/loss/SoftmaxLayer_loss/Sum_grad/Reshape4Adam/gradients/loss/SoftmaxLayer_loss/Sum_grad/Shape*#
_output_shapes
:€€€€€€€€€*

Tmultiples0*
T0
а
BAdam/gradients/loss/SoftmaxLayer_loss/weighted_loss/Mul_grad/ShapeShape^loss/SoftmaxLayer_loss/SparseSoftmaxCrossEntropyWithLogits/SparseSoftmaxCrossEntropyWithLogits*
T0*
out_type0*
_output_shapes
:
Ї
DAdam/gradients/loss/SoftmaxLayer_loss/weighted_loss/Mul_grad/Shape_1Shape6loss/SoftmaxLayer_loss/weighted_loss/broadcast_weights*
_output_shapes
:*
T0*
out_type0
≤
RAdam/gradients/loss/SoftmaxLayer_loss/weighted_loss/Mul_grad/BroadcastGradientArgsBroadcastGradientArgsBAdam/gradients/loss/SoftmaxLayer_loss/weighted_loss/Mul_grad/ShapeDAdam/gradients/loss/SoftmaxLayer_loss/weighted_loss/Mul_grad/Shape_1*
T0*2
_output_shapes 
:€€€€€€€€€:€€€€€€€€€
в
@Adam/gradients/loss/SoftmaxLayer_loss/weighted_loss/Mul_grad/MulMul3Adam/gradients/loss/SoftmaxLayer_loss/Sum_grad/Tile6loss/SoftmaxLayer_loss/weighted_loss/broadcast_weights*#
_output_shapes
:€€€€€€€€€*
T0
Э
@Adam/gradients/loss/SoftmaxLayer_loss/weighted_loss/Mul_grad/SumSum@Adam/gradients/loss/SoftmaxLayer_loss/weighted_loss/Mul_grad/MulRAdam/gradients/loss/SoftmaxLayer_loss/weighted_loss/Mul_grad/BroadcastGradientArgs*
_output_shapes
:*
	keep_dims( *

Tidx0*
T0
С
DAdam/gradients/loss/SoftmaxLayer_loss/weighted_loss/Mul_grad/ReshapeReshape@Adam/gradients/loss/SoftmaxLayer_loss/weighted_loss/Mul_grad/SumBAdam/gradients/loss/SoftmaxLayer_loss/weighted_loss/Mul_grad/Shape*
T0*
Tshape0*#
_output_shapes
:€€€€€€€€€
М
BAdam/gradients/loss/SoftmaxLayer_loss/weighted_loss/Mul_grad/Mul_1Mul^loss/SoftmaxLayer_loss/SparseSoftmaxCrossEntropyWithLogits/SparseSoftmaxCrossEntropyWithLogits3Adam/gradients/loss/SoftmaxLayer_loss/Sum_grad/Tile*#
_output_shapes
:€€€€€€€€€*
T0
£
BAdam/gradients/loss/SoftmaxLayer_loss/weighted_loss/Mul_grad/Sum_1SumBAdam/gradients/loss/SoftmaxLayer_loss/weighted_loss/Mul_grad/Mul_1TAdam/gradients/loss/SoftmaxLayer_loss/weighted_loss/Mul_grad/BroadcastGradientArgs:1*
	keep_dims( *

Tidx0*
T0*
_output_shapes
:
Ч
FAdam/gradients/loss/SoftmaxLayer_loss/weighted_loss/Mul_grad/Reshape_1ReshapeBAdam/gradients/loss/SoftmaxLayer_loss/weighted_loss/Mul_grad/Sum_1DAdam/gradients/loss/SoftmaxLayer_loss/weighted_loss/Mul_grad/Shape_1*
Tshape0*#
_output_shapes
:€€€€€€€€€*
T0
Ї
Adam/gradients/zeros_like	ZerosLike`loss/SoftmaxLayer_loss/SparseSoftmaxCrossEntropyWithLogits/SparseSoftmaxCrossEntropyWithLogits:1*
T0*'
_output_shapes
:€€€€€€€€€
б
ВAdam/gradients/loss/SoftmaxLayer_loss/SparseSoftmaxCrossEntropyWithLogits/SparseSoftmaxCrossEntropyWithLogits_grad/PreventGradientPreventGradient`loss/SoftmaxLayer_loss/SparseSoftmaxCrossEntropyWithLogits/SparseSoftmaxCrossEntropyWithLogits:1*
T0*'
_output_shapes
:€€€€€€€€€*і
message®•Currently there is no way to take the second derivative of sparse_softmax_cross_entropy_with_logits due to the fused implementation's interaction with tf.gradients()
Ќ
БAdam/gradients/loss/SoftmaxLayer_loss/SparseSoftmaxCrossEntropyWithLogits/SparseSoftmaxCrossEntropyWithLogits_grad/ExpandDims/dimConst*
valueB :
€€€€€€€€€*
dtype0*
_output_shapes
: 
У
}Adam/gradients/loss/SoftmaxLayer_loss/SparseSoftmaxCrossEntropyWithLogits/SparseSoftmaxCrossEntropyWithLogits_grad/ExpandDims
ExpandDimsDAdam/gradients/loss/SoftmaxLayer_loss/weighted_loss/Mul_grad/ReshapeБAdam/gradients/loss/SoftmaxLayer_loss/SparseSoftmaxCrossEntropyWithLogits/SparseSoftmaxCrossEntropyWithLogits_grad/ExpandDims/dim*'
_output_shapes
:€€€€€€€€€*

Tdim0*
T0
≥
vAdam/gradients/loss/SoftmaxLayer_loss/SparseSoftmaxCrossEntropyWithLogits/SparseSoftmaxCrossEntropyWithLogits_grad/mulMul}Adam/gradients/loss/SoftmaxLayer_loss/SparseSoftmaxCrossEntropyWithLogits/SparseSoftmaxCrossEntropyWithLogits_grad/ExpandDimsВAdam/gradients/loss/SoftmaxLayer_loss/SparseSoftmaxCrossEntropyWithLogits/SparseSoftmaxCrossEntropyWithLogits_grad/PreventGradient*
T0*'
_output_shapes
:€€€€€€€€€
О
:Adam/gradients/loss/SoftmaxLayer_loss/Reshape_1_grad/ShapeShapeSoftmaxLayer/BiasAdd*
T0*
out_type0*
_output_shapes
:
ї
<Adam/gradients/loss/SoftmaxLayer_loss/Reshape_1_grad/ReshapeReshapevAdam/gradients/loss/SoftmaxLayer_loss/SparseSoftmaxCrossEntropyWithLogits/SparseSoftmaxCrossEntropyWithLogits_grad/mul:Adam/gradients/loss/SoftmaxLayer_loss/Reshape_1_grad/Shape*
T0*
Tshape0*'
_output_shapes
:€€€€€€€€€
љ
4Adam/gradients/SoftmaxLayer/BiasAdd_grad/BiasAddGradBiasAddGrad<Adam/gradients/loss/SoftmaxLayer_loss/Reshape_1_grad/Reshape*
data_formatNHWC*
_output_shapes
:*
T0
т
.Adam/gradients/SoftmaxLayer/MatMul_grad/MatMulMatMul<Adam/gradients/loss/SoftmaxLayer_loss/Reshape_1_grad/Reshape"SoftmaxLayer/MatMul/ReadVariableOp*
T0*'
_output_shapes
:€€€€€€€€€d*
transpose_a( *
transpose_b(
џ
0Adam/gradients/SoftmaxLayer/MatMul_grad/MatMul_1MatMuldropout_1/Identity<Adam/gradients/loss/SoftmaxLayer_loss/Reshape_1_grad/Reshape*
T0*
_output_shapes

:d*
transpose_a(*
transpose_b( 
ѓ
.Adam/gradients/activation_1/Relu_grad/ReluGradReluGrad.Adam/gradients/SoftmaxLayer/MatMul_grad/MatMulactivation_1/Relu*'
_output_shapes
:€€€€€€€€€d*
T0
§
?Adam/gradients/batch_normalization_1/batchnorm/add_1_grad/ShapeShape%batch_normalization_1/batchnorm/mul_1*
T0*
out_type0*
_output_shapes
:
Л
AAdam/gradients/batch_normalization_1/batchnorm/add_1_grad/Shape_1Const*
valueB:d*
dtype0*
_output_shapes
:
©
OAdam/gradients/batch_normalization_1/batchnorm/add_1_grad/BroadcastGradientArgsBroadcastGradientArgs?Adam/gradients/batch_normalization_1/batchnorm/add_1_grad/ShapeAAdam/gradients/batch_normalization_1/batchnorm/add_1_grad/Shape_1*
T0*2
_output_shapes 
:€€€€€€€€€:€€€€€€€€€
Е
=Adam/gradients/batch_normalization_1/batchnorm/add_1_grad/SumSum.Adam/gradients/activation_1/Relu_grad/ReluGradOAdam/gradients/batch_normalization_1/batchnorm/add_1_grad/BroadcastGradientArgs*
T0*
_output_shapes
:*
	keep_dims( *

Tidx0
М
AAdam/gradients/batch_normalization_1/batchnorm/add_1_grad/ReshapeReshape=Adam/gradients/batch_normalization_1/batchnorm/add_1_grad/Sum?Adam/gradients/batch_normalization_1/batchnorm/add_1_grad/Shape*
T0*
Tshape0*'
_output_shapes
:€€€€€€€€€d
Й
?Adam/gradients/batch_normalization_1/batchnorm/add_1_grad/Sum_1Sum.Adam/gradients/activation_1/Relu_grad/ReluGradQAdam/gradients/batch_normalization_1/batchnorm/add_1_grad/BroadcastGradientArgs:1*
	keep_dims( *

Tidx0*
T0*
_output_shapes
:
Е
CAdam/gradients/batch_normalization_1/batchnorm/add_1_grad/Reshape_1Reshape?Adam/gradients/batch_normalization_1/batchnorm/add_1_grad/Sum_1AAdam/gradients/batch_normalization_1/batchnorm/add_1_grad/Shape_1*
_output_shapes
:d*
T0*
Tshape0
У
?Adam/gradients/batch_normalization_1/batchnorm/mul_1_grad/ShapeShapeHiddenLayer2/BiasAdd*
T0*
out_type0*
_output_shapes
:
Л
AAdam/gradients/batch_normalization_1/batchnorm/mul_1_grad/Shape_1Const*
valueB:d*
dtype0*
_output_shapes
:
©
OAdam/gradients/batch_normalization_1/batchnorm/mul_1_grad/BroadcastGradientArgsBroadcastGradientArgs?Adam/gradients/batch_normalization_1/batchnorm/mul_1_grad/ShapeAAdam/gradients/batch_normalization_1/batchnorm/mul_1_grad/Shape_1*2
_output_shapes 
:€€€€€€€€€:€€€€€€€€€*
T0
ё
=Adam/gradients/batch_normalization_1/batchnorm/mul_1_grad/MulMulAAdam/gradients/batch_normalization_1/batchnorm/add_1_grad/Reshape#batch_normalization_1/batchnorm/mul*'
_output_shapes
:€€€€€€€€€d*
T0
Ф
=Adam/gradients/batch_normalization_1/batchnorm/mul_1_grad/SumSum=Adam/gradients/batch_normalization_1/batchnorm/mul_1_grad/MulOAdam/gradients/batch_normalization_1/batchnorm/mul_1_grad/BroadcastGradientArgs*
T0*
_output_shapes
:*
	keep_dims( *

Tidx0
М
AAdam/gradients/batch_normalization_1/batchnorm/mul_1_grad/ReshapeReshape=Adam/gradients/batch_normalization_1/batchnorm/mul_1_grad/Sum?Adam/gradients/batch_normalization_1/batchnorm/mul_1_grad/Shape*
T0*
Tshape0*'
_output_shapes
:€€€€€€€€€d
—
?Adam/gradients/batch_normalization_1/batchnorm/mul_1_grad/Mul_1MulHiddenLayer2/BiasAddAAdam/gradients/batch_normalization_1/batchnorm/add_1_grad/Reshape*'
_output_shapes
:€€€€€€€€€d*
T0
Ъ
?Adam/gradients/batch_normalization_1/batchnorm/mul_1_grad/Sum_1Sum?Adam/gradients/batch_normalization_1/batchnorm/mul_1_grad/Mul_1QAdam/gradients/batch_normalization_1/batchnorm/mul_1_grad/BroadcastGradientArgs:1*
T0*
_output_shapes
:*
	keep_dims( *

Tidx0
Е
CAdam/gradients/batch_normalization_1/batchnorm/mul_1_grad/Reshape_1Reshape?Adam/gradients/batch_normalization_1/batchnorm/mul_1_grad/Sum_1AAdam/gradients/batch_normalization_1/batchnorm/mul_1_grad/Shape_1*
T0*
Tshape0*
_output_shapes
:d
ђ
;Adam/gradients/batch_normalization_1/batchnorm/sub_grad/NegNegCAdam/gradients/batch_normalization_1/batchnorm/add_1_grad/Reshape_1*
T0*
_output_shapes
:d
¬
4Adam/gradients/HiddenLayer2/BiasAdd_grad/BiasAddGradBiasAddGradAAdam/gradients/batch_normalization_1/batchnorm/mul_1_grad/Reshape*
data_formatNHWC*
_output_shapes
:d*
T0
Ћ
=Adam/gradients/batch_normalization_1/batchnorm/mul_2_grad/MulMul;Adam/gradients/batch_normalization_1/batchnorm/sub_grad/Neg#batch_normalization_1/batchnorm/mul*
T0*
_output_shapes
:d
Џ
?Adam/gradients/batch_normalization_1/batchnorm/mul_2_grad/Mul_1Mul;Adam/gradients/batch_normalization_1/batchnorm/sub_grad/Neg0batch_normalization_1/batchnorm/ReadVariableOp_1*
T0*
_output_shapes
:d
ч
.Adam/gradients/HiddenLayer2/MatMul_grad/MatMulMatMulAAdam/gradients/batch_normalization_1/batchnorm/mul_1_grad/Reshape"HiddenLayer2/MatMul/ReadVariableOp*'
_output_shapes
:€€€€€€€€€d*
transpose_a( *
transpose_b(*
T0
ё
0Adam/gradients/HiddenLayer2/MatMul_grad/MatMul_1MatMuldropout/IdentityAAdam/gradients/batch_normalization_1/batchnorm/mul_1_grad/Reshape*
T0*
_output_shapes

:dd*
transpose_a(*
transpose_b( 
І
Adam/gradients/AddNAddNCAdam/gradients/batch_normalization_1/batchnorm/mul_1_grad/Reshape_1?Adam/gradients/batch_normalization_1/batchnorm/mul_2_grad/Mul_1*
T0*V
_classL
JHloc:@Adam/gradients/batch_normalization_1/batchnorm/mul_1_grad/Reshape_1*
N*
_output_shapes
:d
∞
;Adam/gradients/batch_normalization_1/batchnorm/mul_grad/MulMulAdam/gradients/AddN2batch_normalization_1/batchnorm/mul/ReadVariableOp*
T0*
_output_shapes
:d
•
=Adam/gradients/batch_normalization_1/batchnorm/mul_grad/Mul_1MulAdam/gradients/AddN%batch_normalization_1/batchnorm/Rsqrt*
T0*
_output_shapes
:d
Ђ
,Adam/gradients/activation/Relu_grad/ReluGradReluGrad.Adam/gradients/HiddenLayer2/MatMul_grad/MatMulactivation/Relu*
T0*'
_output_shapes
:€€€€€€€€€d
†
=Adam/gradients/batch_normalization/batchnorm/add_1_grad/ShapeShape#batch_normalization/batchnorm/mul_1*
_output_shapes
:*
T0*
out_type0
Й
?Adam/gradients/batch_normalization/batchnorm/add_1_grad/Shape_1Const*
valueB:d*
dtype0*
_output_shapes
:
£
MAdam/gradients/batch_normalization/batchnorm/add_1_grad/BroadcastGradientArgsBroadcastGradientArgs=Adam/gradients/batch_normalization/batchnorm/add_1_grad/Shape?Adam/gradients/batch_normalization/batchnorm/add_1_grad/Shape_1*2
_output_shapes 
:€€€€€€€€€:€€€€€€€€€*
T0
€
;Adam/gradients/batch_normalization/batchnorm/add_1_grad/SumSum,Adam/gradients/activation/Relu_grad/ReluGradMAdam/gradients/batch_normalization/batchnorm/add_1_grad/BroadcastGradientArgs*
	keep_dims( *

Tidx0*
T0*
_output_shapes
:
Ж
?Adam/gradients/batch_normalization/batchnorm/add_1_grad/ReshapeReshape;Adam/gradients/batch_normalization/batchnorm/add_1_grad/Sum=Adam/gradients/batch_normalization/batchnorm/add_1_grad/Shape*
T0*
Tshape0*'
_output_shapes
:€€€€€€€€€d
Г
=Adam/gradients/batch_normalization/batchnorm/add_1_grad/Sum_1Sum,Adam/gradients/activation/Relu_grad/ReluGradOAdam/gradients/batch_normalization/batchnorm/add_1_grad/BroadcastGradientArgs:1*
	keep_dims( *

Tidx0*
T0*
_output_shapes
:
€
AAdam/gradients/batch_normalization/batchnorm/add_1_grad/Reshape_1Reshape=Adam/gradients/batch_normalization/batchnorm/add_1_grad/Sum_1?Adam/gradients/batch_normalization/batchnorm/add_1_grad/Shape_1*
T0*
Tshape0*
_output_shapes
:d
Т
=Adam/gradients/batch_normalization/batchnorm/mul_1_grad/ShapeShapeHidden1Layer1/BiasAdd*
out_type0*
_output_shapes
:*
T0
Й
?Adam/gradients/batch_normalization/batchnorm/mul_1_grad/Shape_1Const*
valueB:d*
dtype0*
_output_shapes
:
£
MAdam/gradients/batch_normalization/batchnorm/mul_1_grad/BroadcastGradientArgsBroadcastGradientArgs=Adam/gradients/batch_normalization/batchnorm/mul_1_grad/Shape?Adam/gradients/batch_normalization/batchnorm/mul_1_grad/Shape_1*
T0*2
_output_shapes 
:€€€€€€€€€:€€€€€€€€€
Ў
;Adam/gradients/batch_normalization/batchnorm/mul_1_grad/MulMul?Adam/gradients/batch_normalization/batchnorm/add_1_grad/Reshape!batch_normalization/batchnorm/mul*
T0*'
_output_shapes
:€€€€€€€€€d
О
;Adam/gradients/batch_normalization/batchnorm/mul_1_grad/SumSum;Adam/gradients/batch_normalization/batchnorm/mul_1_grad/MulMAdam/gradients/batch_normalization/batchnorm/mul_1_grad/BroadcastGradientArgs*
_output_shapes
:*
	keep_dims( *

Tidx0*
T0
Ж
?Adam/gradients/batch_normalization/batchnorm/mul_1_grad/ReshapeReshape;Adam/gradients/batch_normalization/batchnorm/mul_1_grad/Sum=Adam/gradients/batch_normalization/batchnorm/mul_1_grad/Shape*
T0*
Tshape0*'
_output_shapes
:€€€€€€€€€d
ќ
=Adam/gradients/batch_normalization/batchnorm/mul_1_grad/Mul_1MulHidden1Layer1/BiasAdd?Adam/gradients/batch_normalization/batchnorm/add_1_grad/Reshape*
T0*'
_output_shapes
:€€€€€€€€€d
Ф
=Adam/gradients/batch_normalization/batchnorm/mul_1_grad/Sum_1Sum=Adam/gradients/batch_normalization/batchnorm/mul_1_grad/Mul_1OAdam/gradients/batch_normalization/batchnorm/mul_1_grad/BroadcastGradientArgs:1*
T0*
_output_shapes
:*
	keep_dims( *

Tidx0
€
AAdam/gradients/batch_normalization/batchnorm/mul_1_grad/Reshape_1Reshape=Adam/gradients/batch_normalization/batchnorm/mul_1_grad/Sum_1?Adam/gradients/batch_normalization/batchnorm/mul_1_grad/Shape_1*
_output_shapes
:d*
T0*
Tshape0
®
9Adam/gradients/batch_normalization/batchnorm/sub_grad/NegNegAAdam/gradients/batch_normalization/batchnorm/add_1_grad/Reshape_1*
T0*
_output_shapes
:d
Ѕ
5Adam/gradients/Hidden1Layer1/BiasAdd_grad/BiasAddGradBiasAddGrad?Adam/gradients/batch_normalization/batchnorm/mul_1_grad/Reshape*
T0*
data_formatNHWC*
_output_shapes
:d
≈
;Adam/gradients/batch_normalization/batchnorm/mul_2_grad/MulMul9Adam/gradients/batch_normalization/batchnorm/sub_grad/Neg!batch_normalization/batchnorm/mul*
T0*
_output_shapes
:d
‘
=Adam/gradients/batch_normalization/batchnorm/mul_2_grad/Mul_1Mul9Adam/gradients/batch_normalization/batchnorm/sub_grad/Neg.batch_normalization/batchnorm/ReadVariableOp_1*
T0*
_output_shapes
:d
ч
/Adam/gradients/Hidden1Layer1/MatMul_grad/MatMulMatMul?Adam/gradients/batch_normalization/batchnorm/mul_1_grad/Reshape#Hidden1Layer1/MatMul/ReadVariableOp*
T0*'
_output_shapes
:€€€€€€€€€*
transpose_a( *
transpose_b(
а
1Adam/gradients/Hidden1Layer1/MatMul_grad/MatMul_1MatMulHidden1Layer1_input?Adam/gradients/batch_normalization/batchnorm/mul_1_grad/Reshape*
_output_shapes

:d*
transpose_a(*
transpose_b( *
T0
£
Adam/gradients/AddN_1AddNAAdam/gradients/batch_normalization/batchnorm/mul_1_grad/Reshape_1=Adam/gradients/batch_normalization/batchnorm/mul_2_grad/Mul_1*
N*
_output_shapes
:d*
T0*T
_classJ
HFloc:@Adam/gradients/batch_normalization/batchnorm/mul_1_grad/Reshape_1
Ѓ
9Adam/gradients/batch_normalization/batchnorm/mul_grad/MulMulAdam/gradients/AddN_10batch_normalization/batchnorm/mul/ReadVariableOp*
_output_shapes
:d*
T0
£
;Adam/gradients/batch_normalization/batchnorm/mul_grad/Mul_1MulAdam/gradients/AddN_1#batch_normalization/batchnorm/Rsqrt*
_output_shapes
:d*
T0
{
Adam/iter/Initializer/zerosConst*
value	B	 R *
_class
loc:@Adam/iter*
dtype0	*
_output_shapes
: 
Х
	Adam/iterVarHandleOp*
	container *
shape: *
dtype0	*
_output_shapes
: *
shared_name	Adam/iter*
_class
loc:@Adam/iter
c
*Adam/iter/IsInitialized/VarIsInitializedOpVarIsInitializedOp	Adam/iter*
_output_shapes
: 
w
Adam/iter/AssignAssignVariableOp	Adam/iterAdam/iter/Initializer/zeros*
_class
loc:@Adam/iter*
dtype0	
}
Adam/iter/Read/ReadVariableOpReadVariableOp	Adam/iter*
_class
loc:@Adam/iter*
dtype0	*
_output_shapes
: 
К
%Adam/beta_1/Initializer/initial_valueConst*
valueB
 *fff?*
_class
loc:@Adam/beta_1*
dtype0*
_output_shapes
: 
Ы
Adam/beta_1VarHandleOp*
shared_nameAdam/beta_1*
_class
loc:@Adam/beta_1*
	container *
shape: *
dtype0*
_output_shapes
: 
g
,Adam/beta_1/IsInitialized/VarIsInitializedOpVarIsInitializedOpAdam/beta_1*
_output_shapes
: 
З
Adam/beta_1/AssignAssignVariableOpAdam/beta_1%Adam/beta_1/Initializer/initial_value*
_class
loc:@Adam/beta_1*
dtype0
Г
Adam/beta_1/Read/ReadVariableOpReadVariableOpAdam/beta_1*
_class
loc:@Adam/beta_1*
dtype0*
_output_shapes
: 
К
%Adam/beta_2/Initializer/initial_valueConst*
valueB
 *wЊ?*
_class
loc:@Adam/beta_2*
dtype0*
_output_shapes
: 
Ы
Adam/beta_2VarHandleOp*
shared_nameAdam/beta_2*
_class
loc:@Adam/beta_2*
	container *
shape: *
dtype0*
_output_shapes
: 
g
,Adam/beta_2/IsInitialized/VarIsInitializedOpVarIsInitializedOpAdam/beta_2*
_output_shapes
: 
З
Adam/beta_2/AssignAssignVariableOpAdam/beta_2%Adam/beta_2/Initializer/initial_value*
dtype0*
_class
loc:@Adam/beta_2
Г
Adam/beta_2/Read/ReadVariableOpReadVariableOpAdam/beta_2*
dtype0*
_output_shapes
: *
_class
loc:@Adam/beta_2
И
$Adam/decay/Initializer/initial_valueConst*
valueB
 *    *
_class
loc:@Adam/decay*
dtype0*
_output_shapes
: 
Ш

Adam/decayVarHandleOp*
shared_name
Adam/decay*
_class
loc:@Adam/decay*
	container *
shape: *
dtype0*
_output_shapes
: 
e
+Adam/decay/IsInitialized/VarIsInitializedOpVarIsInitializedOp
Adam/decay*
_output_shapes
: 
Г
Adam/decay/AssignAssignVariableOp
Adam/decay$Adam/decay/Initializer/initial_value*
_class
loc:@Adam/decay*
dtype0
А
Adam/decay/Read/ReadVariableOpReadVariableOp
Adam/decay*
_class
loc:@Adam/decay*
dtype0*
_output_shapes
: 
Ш
,Adam/learning_rate/Initializer/initial_valueConst*
valueB
 *oГ:*%
_class
loc:@Adam/learning_rate*
dtype0*
_output_shapes
: 
∞
Adam/learning_rateVarHandleOp*#
shared_nameAdam/learning_rate*%
_class
loc:@Adam/learning_rate*
	container *
shape: *
dtype0*
_output_shapes
: 
u
3Adam/learning_rate/IsInitialized/VarIsInitializedOpVarIsInitializedOpAdam/learning_rate*
_output_shapes
: 
£
Adam/learning_rate/AssignAssignVariableOpAdam/learning_rate,Adam/learning_rate/Initializer/initial_value*%
_class
loc:@Adam/learning_rate*
dtype0
Ш
&Adam/learning_rate/Read/ReadVariableOpReadVariableOpAdam/learning_rate*%
_class
loc:@Adam/learning_rate*
dtype0*
_output_shapes
: 
Ђ
-Adam/Hidden1Layer1/kernel/m/Initializer/zerosConst*'
_class
loc:@Hidden1Layer1/kernel*
valueBd*    *
dtype0*
_output_shapes

:d
ћ
Adam/Hidden1Layer1/kernel/mVarHandleOp*,
shared_nameAdam/Hidden1Layer1/kernel/m*'
_class
loc:@Hidden1Layer1/kernel*
	container *
shape
:d*
dtype0*
_output_shapes
: 
∞
<Adam/Hidden1Layer1/kernel/m/IsInitialized/VarIsInitializedOpVarIsInitializedOpAdam/Hidden1Layer1/kernel/m*'
_class
loc:@Hidden1Layer1/kernel*
_output_shapes
: 
Є
"Adam/Hidden1Layer1/kernel/m/AssignAssignVariableOpAdam/Hidden1Layer1/kernel/m-Adam/Hidden1Layer1/kernel/m/Initializer/zeros*'
_class
loc:@Hidden1Layer1/kernel*
dtype0
і
/Adam/Hidden1Layer1/kernel/m/Read/ReadVariableOpReadVariableOpAdam/Hidden1Layer1/kernel/m*'
_class
loc:@Hidden1Layer1/kernel*
dtype0*
_output_shapes

:d
Я
+Adam/Hidden1Layer1/bias/m/Initializer/zerosConst*%
_class
loc:@Hidden1Layer1/bias*
valueBd*    *
dtype0*
_output_shapes
:d
¬
Adam/Hidden1Layer1/bias/mVarHandleOp*%
_class
loc:@Hidden1Layer1/bias*
	container *
shape:d*
dtype0*
_output_shapes
: **
shared_nameAdam/Hidden1Layer1/bias/m
™
:Adam/Hidden1Layer1/bias/m/IsInitialized/VarIsInitializedOpVarIsInitializedOpAdam/Hidden1Layer1/bias/m*%
_class
loc:@Hidden1Layer1/bias*
_output_shapes
: 
∞
 Adam/Hidden1Layer1/bias/m/AssignAssignVariableOpAdam/Hidden1Layer1/bias/m+Adam/Hidden1Layer1/bias/m/Initializer/zeros*%
_class
loc:@Hidden1Layer1/bias*
dtype0
™
-Adam/Hidden1Layer1/bias/m/Read/ReadVariableOpReadVariableOpAdam/Hidden1Layer1/bias/m*%
_class
loc:@Hidden1Layer1/bias*
dtype0*
_output_shapes
:d
≠
2Adam/batch_normalization/gamma/m/Initializer/zerosConst*,
_class"
 loc:@batch_normalization/gamma*
valueBd*    *
dtype0*
_output_shapes
:d
„
 Adam/batch_normalization/gamma/mVarHandleOp*,
_class"
 loc:@batch_normalization/gamma*
	container *
shape:d*
dtype0*
_output_shapes
: *1
shared_name" Adam/batch_normalization/gamma/m
њ
AAdam/batch_normalization/gamma/m/IsInitialized/VarIsInitializedOpVarIsInitializedOp Adam/batch_normalization/gamma/m*,
_class"
 loc:@batch_normalization/gamma*
_output_shapes
: 
ћ
'Adam/batch_normalization/gamma/m/AssignAssignVariableOp Adam/batch_normalization/gamma/m2Adam/batch_normalization/gamma/m/Initializer/zeros*,
_class"
 loc:@batch_normalization/gamma*
dtype0
њ
4Adam/batch_normalization/gamma/m/Read/ReadVariableOpReadVariableOp Adam/batch_normalization/gamma/m*,
_class"
 loc:@batch_normalization/gamma*
dtype0*
_output_shapes
:d
Ђ
1Adam/batch_normalization/beta/m/Initializer/zerosConst*
dtype0*
_output_shapes
:d*+
_class!
loc:@batch_normalization/beta*
valueBd*    
‘
Adam/batch_normalization/beta/mVarHandleOp*
shape:d*
dtype0*
_output_shapes
: *0
shared_name!Adam/batch_normalization/beta/m*+
_class!
loc:@batch_normalization/beta*
	container 
Љ
@Adam/batch_normalization/beta/m/IsInitialized/VarIsInitializedOpVarIsInitializedOpAdam/batch_normalization/beta/m*
_output_shapes
: *+
_class!
loc:@batch_normalization/beta
»
&Adam/batch_normalization/beta/m/AssignAssignVariableOpAdam/batch_normalization/beta/m1Adam/batch_normalization/beta/m/Initializer/zeros*+
_class!
loc:@batch_normalization/beta*
dtype0
Љ
3Adam/batch_normalization/beta/m/Read/ReadVariableOpReadVariableOpAdam/batch_normalization/beta/m*
_output_shapes
:d*+
_class!
loc:@batch_normalization/beta*
dtype0
µ
<Adam/HiddenLayer2/kernel/m/Initializer/zeros/shape_as_tensorConst*&
_class
loc:@HiddenLayer2/kernel*
valueB"d   d   *
dtype0*
_output_shapes
:
Я
2Adam/HiddenLayer2/kernel/m/Initializer/zeros/ConstConst*
dtype0*
_output_shapes
: *&
_class
loc:@HiddenLayer2/kernel*
valueB
 *    
Й
,Adam/HiddenLayer2/kernel/m/Initializer/zerosFill<Adam/HiddenLayer2/kernel/m/Initializer/zeros/shape_as_tensor2Adam/HiddenLayer2/kernel/m/Initializer/zeros/Const*
T0*&
_class
loc:@HiddenLayer2/kernel*

index_type0*
_output_shapes

:dd
…
Adam/HiddenLayer2/kernel/mVarHandleOp*
dtype0*
_output_shapes
: *+
shared_nameAdam/HiddenLayer2/kernel/m*&
_class
loc:@HiddenLayer2/kernel*
	container *
shape
:dd
≠
;Adam/HiddenLayer2/kernel/m/IsInitialized/VarIsInitializedOpVarIsInitializedOpAdam/HiddenLayer2/kernel/m*&
_class
loc:@HiddenLayer2/kernel*
_output_shapes
: 
і
!Adam/HiddenLayer2/kernel/m/AssignAssignVariableOpAdam/HiddenLayer2/kernel/m,Adam/HiddenLayer2/kernel/m/Initializer/zeros*
dtype0*&
_class
loc:@HiddenLayer2/kernel
±
.Adam/HiddenLayer2/kernel/m/Read/ReadVariableOpReadVariableOpAdam/HiddenLayer2/kernel/m*&
_class
loc:@HiddenLayer2/kernel*
dtype0*
_output_shapes

:dd
Э
*Adam/HiddenLayer2/bias/m/Initializer/zerosConst*$
_class
loc:@HiddenLayer2/bias*
valueBd*    *
dtype0*
_output_shapes
:d
њ
Adam/HiddenLayer2/bias/mVarHandleOp*
dtype0*
_output_shapes
: *)
shared_nameAdam/HiddenLayer2/bias/m*$
_class
loc:@HiddenLayer2/bias*
	container *
shape:d
І
9Adam/HiddenLayer2/bias/m/IsInitialized/VarIsInitializedOpVarIsInitializedOpAdam/HiddenLayer2/bias/m*
_output_shapes
: *$
_class
loc:@HiddenLayer2/bias
ђ
Adam/HiddenLayer2/bias/m/AssignAssignVariableOpAdam/HiddenLayer2/bias/m*Adam/HiddenLayer2/bias/m/Initializer/zeros*$
_class
loc:@HiddenLayer2/bias*
dtype0
І
,Adam/HiddenLayer2/bias/m/Read/ReadVariableOpReadVariableOpAdam/HiddenLayer2/bias/m*$
_class
loc:@HiddenLayer2/bias*
dtype0*
_output_shapes
:d
±
4Adam/batch_normalization_1/gamma/m/Initializer/zerosConst*.
_class$
" loc:@batch_normalization_1/gamma*
valueBd*    *
dtype0*
_output_shapes
:d
Ё
"Adam/batch_normalization_1/gamma/mVarHandleOp*.
_class$
" loc:@batch_normalization_1/gamma*
	container *
shape:d*
dtype0*
_output_shapes
: *3
shared_name$"Adam/batch_normalization_1/gamma/m
≈
CAdam/batch_normalization_1/gamma/m/IsInitialized/VarIsInitializedOpVarIsInitializedOp"Adam/batch_normalization_1/gamma/m*
_output_shapes
: *.
_class$
" loc:@batch_normalization_1/gamma
‘
)Adam/batch_normalization_1/gamma/m/AssignAssignVariableOp"Adam/batch_normalization_1/gamma/m4Adam/batch_normalization_1/gamma/m/Initializer/zeros*
dtype0*.
_class$
" loc:@batch_normalization_1/gamma
≈
6Adam/batch_normalization_1/gamma/m/Read/ReadVariableOpReadVariableOp"Adam/batch_normalization_1/gamma/m*.
_class$
" loc:@batch_normalization_1/gamma*
dtype0*
_output_shapes
:d
ѓ
3Adam/batch_normalization_1/beta/m/Initializer/zerosConst*-
_class#
!loc:@batch_normalization_1/beta*
valueBd*    *
dtype0*
_output_shapes
:d
Џ
!Adam/batch_normalization_1/beta/mVarHandleOp*
	container *
shape:d*
dtype0*
_output_shapes
: *2
shared_name#!Adam/batch_normalization_1/beta/m*-
_class#
!loc:@batch_normalization_1/beta
¬
BAdam/batch_normalization_1/beta/m/IsInitialized/VarIsInitializedOpVarIsInitializedOp!Adam/batch_normalization_1/beta/m*-
_class#
!loc:@batch_normalization_1/beta*
_output_shapes
: 
–
(Adam/batch_normalization_1/beta/m/AssignAssignVariableOp!Adam/batch_normalization_1/beta/m3Adam/batch_normalization_1/beta/m/Initializer/zeros*-
_class#
!loc:@batch_normalization_1/beta*
dtype0
¬
5Adam/batch_normalization_1/beta/m/Read/ReadVariableOpReadVariableOp!Adam/batch_normalization_1/beta/m*-
_class#
!loc:@batch_normalization_1/beta*
dtype0*
_output_shapes
:d
©
,Adam/SoftmaxLayer/kernel/m/Initializer/zerosConst*&
_class
loc:@SoftmaxLayer/kernel*
valueBd*    *
dtype0*
_output_shapes

:d
…
Adam/SoftmaxLayer/kernel/mVarHandleOp*+
shared_nameAdam/SoftmaxLayer/kernel/m*&
_class
loc:@SoftmaxLayer/kernel*
	container *
shape
:d*
dtype0*
_output_shapes
: 
≠
;Adam/SoftmaxLayer/kernel/m/IsInitialized/VarIsInitializedOpVarIsInitializedOpAdam/SoftmaxLayer/kernel/m*&
_class
loc:@SoftmaxLayer/kernel*
_output_shapes
: 
і
!Adam/SoftmaxLayer/kernel/m/AssignAssignVariableOpAdam/SoftmaxLayer/kernel/m,Adam/SoftmaxLayer/kernel/m/Initializer/zeros*&
_class
loc:@SoftmaxLayer/kernel*
dtype0
±
.Adam/SoftmaxLayer/kernel/m/Read/ReadVariableOpReadVariableOpAdam/SoftmaxLayer/kernel/m*&
_class
loc:@SoftmaxLayer/kernel*
dtype0*
_output_shapes

:d
Э
*Adam/SoftmaxLayer/bias/m/Initializer/zerosConst*$
_class
loc:@SoftmaxLayer/bias*
valueB*    *
dtype0*
_output_shapes
:
њ
Adam/SoftmaxLayer/bias/mVarHandleOp*
	container *
shape:*
dtype0*
_output_shapes
: *)
shared_nameAdam/SoftmaxLayer/bias/m*$
_class
loc:@SoftmaxLayer/bias
І
9Adam/SoftmaxLayer/bias/m/IsInitialized/VarIsInitializedOpVarIsInitializedOpAdam/SoftmaxLayer/bias/m*$
_class
loc:@SoftmaxLayer/bias*
_output_shapes
: 
ђ
Adam/SoftmaxLayer/bias/m/AssignAssignVariableOpAdam/SoftmaxLayer/bias/m*Adam/SoftmaxLayer/bias/m/Initializer/zeros*$
_class
loc:@SoftmaxLayer/bias*
dtype0
І
,Adam/SoftmaxLayer/bias/m/Read/ReadVariableOpReadVariableOpAdam/SoftmaxLayer/bias/m*$
_class
loc:@SoftmaxLayer/bias*
dtype0*
_output_shapes
:
Ђ
-Adam/Hidden1Layer1/kernel/v/Initializer/zerosConst*
dtype0*
_output_shapes

:d*'
_class
loc:@Hidden1Layer1/kernel*
valueBd*    
ћ
Adam/Hidden1Layer1/kernel/vVarHandleOp*
shape
:d*
dtype0*
_output_shapes
: *,
shared_nameAdam/Hidden1Layer1/kernel/v*'
_class
loc:@Hidden1Layer1/kernel*
	container 
∞
<Adam/Hidden1Layer1/kernel/v/IsInitialized/VarIsInitializedOpVarIsInitializedOpAdam/Hidden1Layer1/kernel/v*'
_class
loc:@Hidden1Layer1/kernel*
_output_shapes
: 
Є
"Adam/Hidden1Layer1/kernel/v/AssignAssignVariableOpAdam/Hidden1Layer1/kernel/v-Adam/Hidden1Layer1/kernel/v/Initializer/zeros*'
_class
loc:@Hidden1Layer1/kernel*
dtype0
і
/Adam/Hidden1Layer1/kernel/v/Read/ReadVariableOpReadVariableOpAdam/Hidden1Layer1/kernel/v*'
_class
loc:@Hidden1Layer1/kernel*
dtype0*
_output_shapes

:d
Я
+Adam/Hidden1Layer1/bias/v/Initializer/zerosConst*%
_class
loc:@Hidden1Layer1/bias*
valueBd*    *
dtype0*
_output_shapes
:d
¬
Adam/Hidden1Layer1/bias/vVarHandleOp*
dtype0*
_output_shapes
: **
shared_nameAdam/Hidden1Layer1/bias/v*%
_class
loc:@Hidden1Layer1/bias*
	container *
shape:d
™
:Adam/Hidden1Layer1/bias/v/IsInitialized/VarIsInitializedOpVarIsInitializedOpAdam/Hidden1Layer1/bias/v*
_output_shapes
: *%
_class
loc:@Hidden1Layer1/bias
∞
 Adam/Hidden1Layer1/bias/v/AssignAssignVariableOpAdam/Hidden1Layer1/bias/v+Adam/Hidden1Layer1/bias/v/Initializer/zeros*%
_class
loc:@Hidden1Layer1/bias*
dtype0
™
-Adam/Hidden1Layer1/bias/v/Read/ReadVariableOpReadVariableOpAdam/Hidden1Layer1/bias/v*%
_class
loc:@Hidden1Layer1/bias*
dtype0*
_output_shapes
:d
≠
2Adam/batch_normalization/gamma/v/Initializer/zerosConst*,
_class"
 loc:@batch_normalization/gamma*
valueBd*    *
dtype0*
_output_shapes
:d
„
 Adam/batch_normalization/gamma/vVarHandleOp*
dtype0*
_output_shapes
: *1
shared_name" Adam/batch_normalization/gamma/v*,
_class"
 loc:@batch_normalization/gamma*
	container *
shape:d
њ
AAdam/batch_normalization/gamma/v/IsInitialized/VarIsInitializedOpVarIsInitializedOp Adam/batch_normalization/gamma/v*,
_class"
 loc:@batch_normalization/gamma*
_output_shapes
: 
ћ
'Adam/batch_normalization/gamma/v/AssignAssignVariableOp Adam/batch_normalization/gamma/v2Adam/batch_normalization/gamma/v/Initializer/zeros*,
_class"
 loc:@batch_normalization/gamma*
dtype0
њ
4Adam/batch_normalization/gamma/v/Read/ReadVariableOpReadVariableOp Adam/batch_normalization/gamma/v*
_output_shapes
:d*,
_class"
 loc:@batch_normalization/gamma*
dtype0
Ђ
1Adam/batch_normalization/beta/v/Initializer/zerosConst*+
_class!
loc:@batch_normalization/beta*
valueBd*    *
dtype0*
_output_shapes
:d
‘
Adam/batch_normalization/beta/vVarHandleOp*0
shared_name!Adam/batch_normalization/beta/v*+
_class!
loc:@batch_normalization/beta*
	container *
shape:d*
dtype0*
_output_shapes
: 
Љ
@Adam/batch_normalization/beta/v/IsInitialized/VarIsInitializedOpVarIsInitializedOpAdam/batch_normalization/beta/v*+
_class!
loc:@batch_normalization/beta*
_output_shapes
: 
»
&Adam/batch_normalization/beta/v/AssignAssignVariableOpAdam/batch_normalization/beta/v1Adam/batch_normalization/beta/v/Initializer/zeros*+
_class!
loc:@batch_normalization/beta*
dtype0
Љ
3Adam/batch_normalization/beta/v/Read/ReadVariableOpReadVariableOpAdam/batch_normalization/beta/v*
_output_shapes
:d*+
_class!
loc:@batch_normalization/beta*
dtype0
µ
<Adam/HiddenLayer2/kernel/v/Initializer/zeros/shape_as_tensorConst*&
_class
loc:@HiddenLayer2/kernel*
valueB"d   d   *
dtype0*
_output_shapes
:
Я
2Adam/HiddenLayer2/kernel/v/Initializer/zeros/ConstConst*
dtype0*
_output_shapes
: *&
_class
loc:@HiddenLayer2/kernel*
valueB
 *    
Й
,Adam/HiddenLayer2/kernel/v/Initializer/zerosFill<Adam/HiddenLayer2/kernel/v/Initializer/zeros/shape_as_tensor2Adam/HiddenLayer2/kernel/v/Initializer/zeros/Const*
_output_shapes

:dd*
T0*&
_class
loc:@HiddenLayer2/kernel*

index_type0
…
Adam/HiddenLayer2/kernel/vVarHandleOp*
_output_shapes
: *+
shared_nameAdam/HiddenLayer2/kernel/v*&
_class
loc:@HiddenLayer2/kernel*
	container *
shape
:dd*
dtype0
≠
;Adam/HiddenLayer2/kernel/v/IsInitialized/VarIsInitializedOpVarIsInitializedOpAdam/HiddenLayer2/kernel/v*&
_class
loc:@HiddenLayer2/kernel*
_output_shapes
: 
і
!Adam/HiddenLayer2/kernel/v/AssignAssignVariableOpAdam/HiddenLayer2/kernel/v,Adam/HiddenLayer2/kernel/v/Initializer/zeros*&
_class
loc:@HiddenLayer2/kernel*
dtype0
±
.Adam/HiddenLayer2/kernel/v/Read/ReadVariableOpReadVariableOpAdam/HiddenLayer2/kernel/v*&
_class
loc:@HiddenLayer2/kernel*
dtype0*
_output_shapes

:dd
Э
*Adam/HiddenLayer2/bias/v/Initializer/zerosConst*$
_class
loc:@HiddenLayer2/bias*
valueBd*    *
dtype0*
_output_shapes
:d
њ
Adam/HiddenLayer2/bias/vVarHandleOp*
_output_shapes
: *)
shared_nameAdam/HiddenLayer2/bias/v*$
_class
loc:@HiddenLayer2/bias*
	container *
shape:d*
dtype0
І
9Adam/HiddenLayer2/bias/v/IsInitialized/VarIsInitializedOpVarIsInitializedOpAdam/HiddenLayer2/bias/v*
_output_shapes
: *$
_class
loc:@HiddenLayer2/bias
ђ
Adam/HiddenLayer2/bias/v/AssignAssignVariableOpAdam/HiddenLayer2/bias/v*Adam/HiddenLayer2/bias/v/Initializer/zeros*$
_class
loc:@HiddenLayer2/bias*
dtype0
І
,Adam/HiddenLayer2/bias/v/Read/ReadVariableOpReadVariableOpAdam/HiddenLayer2/bias/v*
_output_shapes
:d*$
_class
loc:@HiddenLayer2/bias*
dtype0
±
4Adam/batch_normalization_1/gamma/v/Initializer/zerosConst*.
_class$
" loc:@batch_normalization_1/gamma*
valueBd*    *
dtype0*
_output_shapes
:d
Ё
"Adam/batch_normalization_1/gamma/vVarHandleOp*3
shared_name$"Adam/batch_normalization_1/gamma/v*.
_class$
" loc:@batch_normalization_1/gamma*
	container *
shape:d*
dtype0*
_output_shapes
: 
≈
CAdam/batch_normalization_1/gamma/v/IsInitialized/VarIsInitializedOpVarIsInitializedOp"Adam/batch_normalization_1/gamma/v*.
_class$
" loc:@batch_normalization_1/gamma*
_output_shapes
: 
‘
)Adam/batch_normalization_1/gamma/v/AssignAssignVariableOp"Adam/batch_normalization_1/gamma/v4Adam/batch_normalization_1/gamma/v/Initializer/zeros*.
_class$
" loc:@batch_normalization_1/gamma*
dtype0
≈
6Adam/batch_normalization_1/gamma/v/Read/ReadVariableOpReadVariableOp"Adam/batch_normalization_1/gamma/v*.
_class$
" loc:@batch_normalization_1/gamma*
dtype0*
_output_shapes
:d
ѓ
3Adam/batch_normalization_1/beta/v/Initializer/zerosConst*-
_class#
!loc:@batch_normalization_1/beta*
valueBd*    *
dtype0*
_output_shapes
:d
Џ
!Adam/batch_normalization_1/beta/vVarHandleOp*
dtype0*
_output_shapes
: *2
shared_name#!Adam/batch_normalization_1/beta/v*-
_class#
!loc:@batch_normalization_1/beta*
	container *
shape:d
¬
BAdam/batch_normalization_1/beta/v/IsInitialized/VarIsInitializedOpVarIsInitializedOp!Adam/batch_normalization_1/beta/v*-
_class#
!loc:@batch_normalization_1/beta*
_output_shapes
: 
–
(Adam/batch_normalization_1/beta/v/AssignAssignVariableOp!Adam/batch_normalization_1/beta/v3Adam/batch_normalization_1/beta/v/Initializer/zeros*-
_class#
!loc:@batch_normalization_1/beta*
dtype0
¬
5Adam/batch_normalization_1/beta/v/Read/ReadVariableOpReadVariableOp!Adam/batch_normalization_1/beta/v*
dtype0*
_output_shapes
:d*-
_class#
!loc:@batch_normalization_1/beta
©
,Adam/SoftmaxLayer/kernel/v/Initializer/zerosConst*
_output_shapes

:d*&
_class
loc:@SoftmaxLayer/kernel*
valueBd*    *
dtype0
…
Adam/SoftmaxLayer/kernel/vVarHandleOp*&
_class
loc:@SoftmaxLayer/kernel*
	container *
shape
:d*
dtype0*
_output_shapes
: *+
shared_nameAdam/SoftmaxLayer/kernel/v
≠
;Adam/SoftmaxLayer/kernel/v/IsInitialized/VarIsInitializedOpVarIsInitializedOpAdam/SoftmaxLayer/kernel/v*&
_class
loc:@SoftmaxLayer/kernel*
_output_shapes
: 
і
!Adam/SoftmaxLayer/kernel/v/AssignAssignVariableOpAdam/SoftmaxLayer/kernel/v,Adam/SoftmaxLayer/kernel/v/Initializer/zeros*&
_class
loc:@SoftmaxLayer/kernel*
dtype0
±
.Adam/SoftmaxLayer/kernel/v/Read/ReadVariableOpReadVariableOpAdam/SoftmaxLayer/kernel/v*
dtype0*
_output_shapes

:d*&
_class
loc:@SoftmaxLayer/kernel
Э
*Adam/SoftmaxLayer/bias/v/Initializer/zerosConst*$
_class
loc:@SoftmaxLayer/bias*
valueB*    *
dtype0*
_output_shapes
:
њ
Adam/SoftmaxLayer/bias/vVarHandleOp*
	container *
shape:*
dtype0*
_output_shapes
: *)
shared_nameAdam/SoftmaxLayer/bias/v*$
_class
loc:@SoftmaxLayer/bias
І
9Adam/SoftmaxLayer/bias/v/IsInitialized/VarIsInitializedOpVarIsInitializedOpAdam/SoftmaxLayer/bias/v*$
_class
loc:@SoftmaxLayer/bias*
_output_shapes
: 
ђ
Adam/SoftmaxLayer/bias/v/AssignAssignVariableOpAdam/SoftmaxLayer/bias/v*Adam/SoftmaxLayer/bias/v/Initializer/zeros*$
_class
loc:@SoftmaxLayer/bias*
dtype0
І
,Adam/SoftmaxLayer/bias/v/Read/ReadVariableOpReadVariableOpAdam/SoftmaxLayer/bias/v*$
_class
loc:@SoftmaxLayer/bias*
dtype0*
_output_shapes
:
p
+Adam/Adam/update_Hidden1Layer1/kernel/ConstConst*
valueB
 *Хњ÷3*
dtype0*
_output_shapes
: 
v
4Adam/Adam/update_Hidden1Layer1/kernel/ReadVariableOpReadVariableOp	Adam/iter*
dtype0	*
_output_shapes
: 
m
+Adam/Adam/update_Hidden1Layer1/kernel/add/yConst*
value	B	 R*
dtype0	*
_output_shapes
: 
і
)Adam/Adam/update_Hidden1Layer1/kernel/addAdd4Adam/Adam/update_Hidden1Layer1/kernel/ReadVariableOp+Adam/Adam/update_Hidden1Layer1/kernel/add/y*
_output_shapes
: *
T0	
Э
*Adam/Adam/update_Hidden1Layer1/kernel/CastCast)Adam/Adam/update_Hidden1Layer1/kernel/add*

SrcT0	*
Truncate( *
_output_shapes
: *

DstT0
|
8Adam/Adam/update_Hidden1Layer1/kernel/Pow/ReadVariableOpReadVariableOpAdam/beta_1*
dtype0*
_output_shapes
: 
Ј
)Adam/Adam/update_Hidden1Layer1/kernel/PowPow8Adam/Adam/update_Hidden1Layer1/kernel/Pow/ReadVariableOp*Adam/Adam/update_Hidden1Layer1/kernel/Cast*
T0*
_output_shapes
: 
~
:Adam/Adam/update_Hidden1Layer1/kernel/Pow_1/ReadVariableOpReadVariableOpAdam/beta_2*
dtype0*
_output_shapes
: 
ї
+Adam/Adam/update_Hidden1Layer1/kernel/Pow_1Pow:Adam/Adam/update_Hidden1Layer1/kernel/Pow_1/ReadVariableOp*Adam/Adam/update_Hidden1Layer1/kernel/Cast*
T0*
_output_shapes
: 
С
FAdam/Adam/update_Hidden1Layer1/kernel/ResourceApplyAdam/ReadVariableOpReadVariableOpAdam/learning_rate*
dtype0*
_output_shapes
: 
М
HAdam/Adam/update_Hidden1Layer1/kernel/ResourceApplyAdam/ReadVariableOp_1ReadVariableOpAdam/beta_1*
dtype0*
_output_shapes
: 
М
HAdam/Adam/update_Hidden1Layer1/kernel/ResourceApplyAdam/ReadVariableOp_2ReadVariableOpAdam/beta_2*
dtype0*
_output_shapes
: 
а
7Adam/Adam/update_Hidden1Layer1/kernel/ResourceApplyAdamResourceApplyAdamHidden1Layer1/kernelAdam/Hidden1Layer1/kernel/mAdam/Hidden1Layer1/kernel/v)Adam/Adam/update_Hidden1Layer1/kernel/Pow+Adam/Adam/update_Hidden1Layer1/kernel/Pow_1FAdam/Adam/update_Hidden1Layer1/kernel/ResourceApplyAdam/ReadVariableOpHAdam/Adam/update_Hidden1Layer1/kernel/ResourceApplyAdam/ReadVariableOp_1HAdam/Adam/update_Hidden1Layer1/kernel/ResourceApplyAdam/ReadVariableOp_2+Adam/Adam/update_Hidden1Layer1/kernel/Const1Adam/gradients/Hidden1Layer1/MatMul_grad/MatMul_1*
use_locking(*
T0*
use_nesterov( 
n
)Adam/Adam/update_Hidden1Layer1/bias/ConstConst*
valueB
 *Хњ÷3*
dtype0*
_output_shapes
: 
t
2Adam/Adam/update_Hidden1Layer1/bias/ReadVariableOpReadVariableOp	Adam/iter*
dtype0	*
_output_shapes
: 
k
)Adam/Adam/update_Hidden1Layer1/bias/add/yConst*
value	B	 R*
dtype0	*
_output_shapes
: 
Ѓ
'Adam/Adam/update_Hidden1Layer1/bias/addAdd2Adam/Adam/update_Hidden1Layer1/bias/ReadVariableOp)Adam/Adam/update_Hidden1Layer1/bias/add/y*
T0	*
_output_shapes
: 
Щ
(Adam/Adam/update_Hidden1Layer1/bias/CastCast'Adam/Adam/update_Hidden1Layer1/bias/add*
_output_shapes
: *

DstT0*

SrcT0	*
Truncate( 
z
6Adam/Adam/update_Hidden1Layer1/bias/Pow/ReadVariableOpReadVariableOpAdam/beta_1*
dtype0*
_output_shapes
: 
±
'Adam/Adam/update_Hidden1Layer1/bias/PowPow6Adam/Adam/update_Hidden1Layer1/bias/Pow/ReadVariableOp(Adam/Adam/update_Hidden1Layer1/bias/Cast*
T0*
_output_shapes
: 
|
8Adam/Adam/update_Hidden1Layer1/bias/Pow_1/ReadVariableOpReadVariableOpAdam/beta_2*
dtype0*
_output_shapes
: 
µ
)Adam/Adam/update_Hidden1Layer1/bias/Pow_1Pow8Adam/Adam/update_Hidden1Layer1/bias/Pow_1/ReadVariableOp(Adam/Adam/update_Hidden1Layer1/bias/Cast*
T0*
_output_shapes
: 
П
DAdam/Adam/update_Hidden1Layer1/bias/ResourceApplyAdam/ReadVariableOpReadVariableOpAdam/learning_rate*
dtype0*
_output_shapes
: 
К
FAdam/Adam/update_Hidden1Layer1/bias/ResourceApplyAdam/ReadVariableOp_1ReadVariableOpAdam/beta_1*
_output_shapes
: *
dtype0
К
FAdam/Adam/update_Hidden1Layer1/bias/ResourceApplyAdam/ReadVariableOp_2ReadVariableOpAdam/beta_2*
dtype0*
_output_shapes
: 
–
5Adam/Adam/update_Hidden1Layer1/bias/ResourceApplyAdamResourceApplyAdamHidden1Layer1/biasAdam/Hidden1Layer1/bias/mAdam/Hidden1Layer1/bias/v'Adam/Adam/update_Hidden1Layer1/bias/Pow)Adam/Adam/update_Hidden1Layer1/bias/Pow_1DAdam/Adam/update_Hidden1Layer1/bias/ResourceApplyAdam/ReadVariableOpFAdam/Adam/update_Hidden1Layer1/bias/ResourceApplyAdam/ReadVariableOp_1FAdam/Adam/update_Hidden1Layer1/bias/ResourceApplyAdam/ReadVariableOp_2)Adam/Adam/update_Hidden1Layer1/bias/Const5Adam/gradients/Hidden1Layer1/BiasAdd_grad/BiasAddGrad*
use_nesterov( *
use_locking(*
T0
u
0Adam/Adam/update_batch_normalization/gamma/ConstConst*
valueB
 *Хњ÷3*
dtype0*
_output_shapes
: 
{
9Adam/Adam/update_batch_normalization/gamma/ReadVariableOpReadVariableOp	Adam/iter*
_output_shapes
: *
dtype0	
r
0Adam/Adam/update_batch_normalization/gamma/add/yConst*
value	B	 R*
dtype0	*
_output_shapes
: 
√
.Adam/Adam/update_batch_normalization/gamma/addAdd9Adam/Adam/update_batch_normalization/gamma/ReadVariableOp0Adam/Adam/update_batch_normalization/gamma/add/y*
T0	*
_output_shapes
: 
І
/Adam/Adam/update_batch_normalization/gamma/CastCast.Adam/Adam/update_batch_normalization/gamma/add*

SrcT0	*
Truncate( *
_output_shapes
: *

DstT0
Б
=Adam/Adam/update_batch_normalization/gamma/Pow/ReadVariableOpReadVariableOpAdam/beta_1*
dtype0*
_output_shapes
: 
∆
.Adam/Adam/update_batch_normalization/gamma/PowPow=Adam/Adam/update_batch_normalization/gamma/Pow/ReadVariableOp/Adam/Adam/update_batch_normalization/gamma/Cast*
_output_shapes
: *
T0
Г
?Adam/Adam/update_batch_normalization/gamma/Pow_1/ReadVariableOpReadVariableOpAdam/beta_2*
dtype0*
_output_shapes
: 
 
0Adam/Adam/update_batch_normalization/gamma/Pow_1Pow?Adam/Adam/update_batch_normalization/gamma/Pow_1/ReadVariableOp/Adam/Adam/update_batch_normalization/gamma/Cast*
T0*
_output_shapes
: 
Ц
KAdam/Adam/update_batch_normalization/gamma/ResourceApplyAdam/ReadVariableOpReadVariableOpAdam/learning_rate*
dtype0*
_output_shapes
: 
С
MAdam/Adam/update_batch_normalization/gamma/ResourceApplyAdam/ReadVariableOp_1ReadVariableOpAdam/beta_1*
dtype0*
_output_shapes
: 
С
MAdam/Adam/update_batch_normalization/gamma/ResourceApplyAdam/ReadVariableOp_2ReadVariableOpAdam/beta_2*
dtype0*
_output_shapes
: 
Ь
<Adam/Adam/update_batch_normalization/gamma/ResourceApplyAdamResourceApplyAdambatch_normalization/gamma Adam/batch_normalization/gamma/m Adam/batch_normalization/gamma/v.Adam/Adam/update_batch_normalization/gamma/Pow0Adam/Adam/update_batch_normalization/gamma/Pow_1KAdam/Adam/update_batch_normalization/gamma/ResourceApplyAdam/ReadVariableOpMAdam/Adam/update_batch_normalization/gamma/ResourceApplyAdam/ReadVariableOp_1MAdam/Adam/update_batch_normalization/gamma/ResourceApplyAdam/ReadVariableOp_20Adam/Adam/update_batch_normalization/gamma/Const;Adam/gradients/batch_normalization/batchnorm/mul_grad/Mul_1*
use_nesterov( *
use_locking(*
T0
t
/Adam/Adam/update_batch_normalization/beta/ConstConst*
dtype0*
_output_shapes
: *
valueB
 *Хњ÷3
z
8Adam/Adam/update_batch_normalization/beta/ReadVariableOpReadVariableOp	Adam/iter*
dtype0	*
_output_shapes
: 
q
/Adam/Adam/update_batch_normalization/beta/add/yConst*
value	B	 R*
dtype0	*
_output_shapes
: 
ј
-Adam/Adam/update_batch_normalization/beta/addAdd8Adam/Adam/update_batch_normalization/beta/ReadVariableOp/Adam/Adam/update_batch_normalization/beta/add/y*
T0	*
_output_shapes
: 
•
.Adam/Adam/update_batch_normalization/beta/CastCast-Adam/Adam/update_batch_normalization/beta/add*

SrcT0	*
Truncate( *
_output_shapes
: *

DstT0
А
<Adam/Adam/update_batch_normalization/beta/Pow/ReadVariableOpReadVariableOpAdam/beta_1*
dtype0*
_output_shapes
: 
√
-Adam/Adam/update_batch_normalization/beta/PowPow<Adam/Adam/update_batch_normalization/beta/Pow/ReadVariableOp.Adam/Adam/update_batch_normalization/beta/Cast*
_output_shapes
: *
T0
В
>Adam/Adam/update_batch_normalization/beta/Pow_1/ReadVariableOpReadVariableOpAdam/beta_2*
dtype0*
_output_shapes
: 
«
/Adam/Adam/update_batch_normalization/beta/Pow_1Pow>Adam/Adam/update_batch_normalization/beta/Pow_1/ReadVariableOp.Adam/Adam/update_batch_normalization/beta/Cast*
_output_shapes
: *
T0
Х
JAdam/Adam/update_batch_normalization/beta/ResourceApplyAdam/ReadVariableOpReadVariableOpAdam/learning_rate*
dtype0*
_output_shapes
: 
Р
LAdam/Adam/update_batch_normalization/beta/ResourceApplyAdam/ReadVariableOp_1ReadVariableOpAdam/beta_1*
_output_shapes
: *
dtype0
Р
LAdam/Adam/update_batch_normalization/beta/ResourceApplyAdam/ReadVariableOp_2ReadVariableOpAdam/beta_2*
dtype0*
_output_shapes
: 
Ш
;Adam/Adam/update_batch_normalization/beta/ResourceApplyAdamResourceApplyAdambatch_normalization/betaAdam/batch_normalization/beta/mAdam/batch_normalization/beta/v-Adam/Adam/update_batch_normalization/beta/Pow/Adam/Adam/update_batch_normalization/beta/Pow_1JAdam/Adam/update_batch_normalization/beta/ResourceApplyAdam/ReadVariableOpLAdam/Adam/update_batch_normalization/beta/ResourceApplyAdam/ReadVariableOp_1LAdam/Adam/update_batch_normalization/beta/ResourceApplyAdam/ReadVariableOp_2/Adam/Adam/update_batch_normalization/beta/ConstAAdam/gradients/batch_normalization/batchnorm/add_1_grad/Reshape_1*
use_locking(*
T0*
use_nesterov( 
o
*Adam/Adam/update_HiddenLayer2/kernel/ConstConst*
valueB
 *Хњ÷3*
dtype0*
_output_shapes
: 
u
3Adam/Adam/update_HiddenLayer2/kernel/ReadVariableOpReadVariableOp	Adam/iter*
dtype0	*
_output_shapes
: 
l
*Adam/Adam/update_HiddenLayer2/kernel/add/yConst*
value	B	 R*
dtype0	*
_output_shapes
: 
±
(Adam/Adam/update_HiddenLayer2/kernel/addAdd3Adam/Adam/update_HiddenLayer2/kernel/ReadVariableOp*Adam/Adam/update_HiddenLayer2/kernel/add/y*
T0	*
_output_shapes
: 
Ы
)Adam/Adam/update_HiddenLayer2/kernel/CastCast(Adam/Adam/update_HiddenLayer2/kernel/add*

SrcT0	*
Truncate( *
_output_shapes
: *

DstT0
{
7Adam/Adam/update_HiddenLayer2/kernel/Pow/ReadVariableOpReadVariableOpAdam/beta_1*
dtype0*
_output_shapes
: 
і
(Adam/Adam/update_HiddenLayer2/kernel/PowPow7Adam/Adam/update_HiddenLayer2/kernel/Pow/ReadVariableOp)Adam/Adam/update_HiddenLayer2/kernel/Cast*
_output_shapes
: *
T0
}
9Adam/Adam/update_HiddenLayer2/kernel/Pow_1/ReadVariableOpReadVariableOpAdam/beta_2*
dtype0*
_output_shapes
: 
Є
*Adam/Adam/update_HiddenLayer2/kernel/Pow_1Pow9Adam/Adam/update_HiddenLayer2/kernel/Pow_1/ReadVariableOp)Adam/Adam/update_HiddenLayer2/kernel/Cast*
T0*
_output_shapes
: 
Р
EAdam/Adam/update_HiddenLayer2/kernel/ResourceApplyAdam/ReadVariableOpReadVariableOpAdam/learning_rate*
dtype0*
_output_shapes
: 
Л
GAdam/Adam/update_HiddenLayer2/kernel/ResourceApplyAdam/ReadVariableOp_1ReadVariableOpAdam/beta_1*
dtype0*
_output_shapes
: 
Л
GAdam/Adam/update_HiddenLayer2/kernel/ResourceApplyAdam/ReadVariableOp_2ReadVariableOpAdam/beta_2*
dtype0*
_output_shapes
: 
’
6Adam/Adam/update_HiddenLayer2/kernel/ResourceApplyAdamResourceApplyAdamHiddenLayer2/kernelAdam/HiddenLayer2/kernel/mAdam/HiddenLayer2/kernel/v(Adam/Adam/update_HiddenLayer2/kernel/Pow*Adam/Adam/update_HiddenLayer2/kernel/Pow_1EAdam/Adam/update_HiddenLayer2/kernel/ResourceApplyAdam/ReadVariableOpGAdam/Adam/update_HiddenLayer2/kernel/ResourceApplyAdam/ReadVariableOp_1GAdam/Adam/update_HiddenLayer2/kernel/ResourceApplyAdam/ReadVariableOp_2*Adam/Adam/update_HiddenLayer2/kernel/Const0Adam/gradients/HiddenLayer2/MatMul_grad/MatMul_1*
T0*
use_nesterov( *
use_locking(
m
(Adam/Adam/update_HiddenLayer2/bias/ConstConst*
valueB
 *Хњ÷3*
dtype0*
_output_shapes
: 
s
1Adam/Adam/update_HiddenLayer2/bias/ReadVariableOpReadVariableOp	Adam/iter*
dtype0	*
_output_shapes
: 
j
(Adam/Adam/update_HiddenLayer2/bias/add/yConst*
value	B	 R*
dtype0	*
_output_shapes
: 
Ђ
&Adam/Adam/update_HiddenLayer2/bias/addAdd1Adam/Adam/update_HiddenLayer2/bias/ReadVariableOp(Adam/Adam/update_HiddenLayer2/bias/add/y*
T0	*
_output_shapes
: 
Ч
'Adam/Adam/update_HiddenLayer2/bias/CastCast&Adam/Adam/update_HiddenLayer2/bias/add*
Truncate( *
_output_shapes
: *

DstT0*

SrcT0	
y
5Adam/Adam/update_HiddenLayer2/bias/Pow/ReadVariableOpReadVariableOpAdam/beta_1*
dtype0*
_output_shapes
: 
Ѓ
&Adam/Adam/update_HiddenLayer2/bias/PowPow5Adam/Adam/update_HiddenLayer2/bias/Pow/ReadVariableOp'Adam/Adam/update_HiddenLayer2/bias/Cast*
_output_shapes
: *
T0
{
7Adam/Adam/update_HiddenLayer2/bias/Pow_1/ReadVariableOpReadVariableOpAdam/beta_2*
dtype0*
_output_shapes
: 
≤
(Adam/Adam/update_HiddenLayer2/bias/Pow_1Pow7Adam/Adam/update_HiddenLayer2/bias/Pow_1/ReadVariableOp'Adam/Adam/update_HiddenLayer2/bias/Cast*
T0*
_output_shapes
: 
О
CAdam/Adam/update_HiddenLayer2/bias/ResourceApplyAdam/ReadVariableOpReadVariableOpAdam/learning_rate*
dtype0*
_output_shapes
: 
Й
EAdam/Adam/update_HiddenLayer2/bias/ResourceApplyAdam/ReadVariableOp_1ReadVariableOpAdam/beta_1*
dtype0*
_output_shapes
: 
Й
EAdam/Adam/update_HiddenLayer2/bias/ResourceApplyAdam/ReadVariableOp_2ReadVariableOpAdam/beta_2*
dtype0*
_output_shapes
: 
≈
4Adam/Adam/update_HiddenLayer2/bias/ResourceApplyAdamResourceApplyAdamHiddenLayer2/biasAdam/HiddenLayer2/bias/mAdam/HiddenLayer2/bias/v&Adam/Adam/update_HiddenLayer2/bias/Pow(Adam/Adam/update_HiddenLayer2/bias/Pow_1CAdam/Adam/update_HiddenLayer2/bias/ResourceApplyAdam/ReadVariableOpEAdam/Adam/update_HiddenLayer2/bias/ResourceApplyAdam/ReadVariableOp_1EAdam/Adam/update_HiddenLayer2/bias/ResourceApplyAdam/ReadVariableOp_2(Adam/Adam/update_HiddenLayer2/bias/Const4Adam/gradients/HiddenLayer2/BiasAdd_grad/BiasAddGrad*
use_locking(*
T0*
use_nesterov( 
w
2Adam/Adam/update_batch_normalization_1/gamma/ConstConst*
valueB
 *Хњ÷3*
dtype0*
_output_shapes
: 
}
;Adam/Adam/update_batch_normalization_1/gamma/ReadVariableOpReadVariableOp	Adam/iter*
dtype0	*
_output_shapes
: 
t
2Adam/Adam/update_batch_normalization_1/gamma/add/yConst*
_output_shapes
: *
value	B	 R*
dtype0	
…
0Adam/Adam/update_batch_normalization_1/gamma/addAdd;Adam/Adam/update_batch_normalization_1/gamma/ReadVariableOp2Adam/Adam/update_batch_normalization_1/gamma/add/y*
T0	*
_output_shapes
: 
Ђ
1Adam/Adam/update_batch_normalization_1/gamma/CastCast0Adam/Adam/update_batch_normalization_1/gamma/add*
Truncate( *
_output_shapes
: *

DstT0*

SrcT0	
Г
?Adam/Adam/update_batch_normalization_1/gamma/Pow/ReadVariableOpReadVariableOpAdam/beta_1*
dtype0*
_output_shapes
: 
ћ
0Adam/Adam/update_batch_normalization_1/gamma/PowPow?Adam/Adam/update_batch_normalization_1/gamma/Pow/ReadVariableOp1Adam/Adam/update_batch_normalization_1/gamma/Cast*
T0*
_output_shapes
: 
Е
AAdam/Adam/update_batch_normalization_1/gamma/Pow_1/ReadVariableOpReadVariableOpAdam/beta_2*
dtype0*
_output_shapes
: 
–
2Adam/Adam/update_batch_normalization_1/gamma/Pow_1PowAAdam/Adam/update_batch_normalization_1/gamma/Pow_1/ReadVariableOp1Adam/Adam/update_batch_normalization_1/gamma/Cast*
T0*
_output_shapes
: 
Ш
MAdam/Adam/update_batch_normalization_1/gamma/ResourceApplyAdam/ReadVariableOpReadVariableOpAdam/learning_rate*
dtype0*
_output_shapes
: 
У
OAdam/Adam/update_batch_normalization_1/gamma/ResourceApplyAdam/ReadVariableOp_1ReadVariableOpAdam/beta_1*
dtype0*
_output_shapes
: 
У
OAdam/Adam/update_batch_normalization_1/gamma/ResourceApplyAdam/ReadVariableOp_2ReadVariableOpAdam/beta_2*
dtype0*
_output_shapes
: 
≤
>Adam/Adam/update_batch_normalization_1/gamma/ResourceApplyAdamResourceApplyAdambatch_normalization_1/gamma"Adam/batch_normalization_1/gamma/m"Adam/batch_normalization_1/gamma/v0Adam/Adam/update_batch_normalization_1/gamma/Pow2Adam/Adam/update_batch_normalization_1/gamma/Pow_1MAdam/Adam/update_batch_normalization_1/gamma/ResourceApplyAdam/ReadVariableOpOAdam/Adam/update_batch_normalization_1/gamma/ResourceApplyAdam/ReadVariableOp_1OAdam/Adam/update_batch_normalization_1/gamma/ResourceApplyAdam/ReadVariableOp_22Adam/Adam/update_batch_normalization_1/gamma/Const=Adam/gradients/batch_normalization_1/batchnorm/mul_grad/Mul_1*
use_locking(*
T0*
use_nesterov( 
v
1Adam/Adam/update_batch_normalization_1/beta/ConstConst*
valueB
 *Хњ÷3*
dtype0*
_output_shapes
: 
|
:Adam/Adam/update_batch_normalization_1/beta/ReadVariableOpReadVariableOp	Adam/iter*
_output_shapes
: *
dtype0	
s
1Adam/Adam/update_batch_normalization_1/beta/add/yConst*
value	B	 R*
dtype0	*
_output_shapes
: 
∆
/Adam/Adam/update_batch_normalization_1/beta/addAdd:Adam/Adam/update_batch_normalization_1/beta/ReadVariableOp1Adam/Adam/update_batch_normalization_1/beta/add/y*
T0	*
_output_shapes
: 
©
0Adam/Adam/update_batch_normalization_1/beta/CastCast/Adam/Adam/update_batch_normalization_1/beta/add*

SrcT0	*
Truncate( *
_output_shapes
: *

DstT0
В
>Adam/Adam/update_batch_normalization_1/beta/Pow/ReadVariableOpReadVariableOpAdam/beta_1*
dtype0*
_output_shapes
: 
…
/Adam/Adam/update_batch_normalization_1/beta/PowPow>Adam/Adam/update_batch_normalization_1/beta/Pow/ReadVariableOp0Adam/Adam/update_batch_normalization_1/beta/Cast*
T0*
_output_shapes
: 
Д
@Adam/Adam/update_batch_normalization_1/beta/Pow_1/ReadVariableOpReadVariableOpAdam/beta_2*
dtype0*
_output_shapes
: 
Ќ
1Adam/Adam/update_batch_normalization_1/beta/Pow_1Pow@Adam/Adam/update_batch_normalization_1/beta/Pow_1/ReadVariableOp0Adam/Adam/update_batch_normalization_1/beta/Cast*
T0*
_output_shapes
: 
Ч
LAdam/Adam/update_batch_normalization_1/beta/ResourceApplyAdam/ReadVariableOpReadVariableOpAdam/learning_rate*
dtype0*
_output_shapes
: 
Т
NAdam/Adam/update_batch_normalization_1/beta/ResourceApplyAdam/ReadVariableOp_1ReadVariableOpAdam/beta_1*
dtype0*
_output_shapes
: 
Т
NAdam/Adam/update_batch_normalization_1/beta/ResourceApplyAdam/ReadVariableOp_2ReadVariableOpAdam/beta_2*
dtype0*
_output_shapes
: 
Ѓ
=Adam/Adam/update_batch_normalization_1/beta/ResourceApplyAdamResourceApplyAdambatch_normalization_1/beta!Adam/batch_normalization_1/beta/m!Adam/batch_normalization_1/beta/v/Adam/Adam/update_batch_normalization_1/beta/Pow1Adam/Adam/update_batch_normalization_1/beta/Pow_1LAdam/Adam/update_batch_normalization_1/beta/ResourceApplyAdam/ReadVariableOpNAdam/Adam/update_batch_normalization_1/beta/ResourceApplyAdam/ReadVariableOp_1NAdam/Adam/update_batch_normalization_1/beta/ResourceApplyAdam/ReadVariableOp_21Adam/Adam/update_batch_normalization_1/beta/ConstCAdam/gradients/batch_normalization_1/batchnorm/add_1_grad/Reshape_1*
use_locking(*
T0*
use_nesterov( 
o
*Adam/Adam/update_SoftmaxLayer/kernel/ConstConst*
valueB
 *Хњ÷3*
dtype0*
_output_shapes
: 
u
3Adam/Adam/update_SoftmaxLayer/kernel/ReadVariableOpReadVariableOp	Adam/iter*
dtype0	*
_output_shapes
: 
l
*Adam/Adam/update_SoftmaxLayer/kernel/add/yConst*
value	B	 R*
dtype0	*
_output_shapes
: 
±
(Adam/Adam/update_SoftmaxLayer/kernel/addAdd3Adam/Adam/update_SoftmaxLayer/kernel/ReadVariableOp*Adam/Adam/update_SoftmaxLayer/kernel/add/y*
T0	*
_output_shapes
: 
Ы
)Adam/Adam/update_SoftmaxLayer/kernel/CastCast(Adam/Adam/update_SoftmaxLayer/kernel/add*

SrcT0	*
Truncate( *
_output_shapes
: *

DstT0
{
7Adam/Adam/update_SoftmaxLayer/kernel/Pow/ReadVariableOpReadVariableOpAdam/beta_1*
dtype0*
_output_shapes
: 
і
(Adam/Adam/update_SoftmaxLayer/kernel/PowPow7Adam/Adam/update_SoftmaxLayer/kernel/Pow/ReadVariableOp)Adam/Adam/update_SoftmaxLayer/kernel/Cast*
T0*
_output_shapes
: 
}
9Adam/Adam/update_SoftmaxLayer/kernel/Pow_1/ReadVariableOpReadVariableOpAdam/beta_2*
dtype0*
_output_shapes
: 
Є
*Adam/Adam/update_SoftmaxLayer/kernel/Pow_1Pow9Adam/Adam/update_SoftmaxLayer/kernel/Pow_1/ReadVariableOp)Adam/Adam/update_SoftmaxLayer/kernel/Cast*
T0*
_output_shapes
: 
Р
EAdam/Adam/update_SoftmaxLayer/kernel/ResourceApplyAdam/ReadVariableOpReadVariableOpAdam/learning_rate*
dtype0*
_output_shapes
: 
Л
GAdam/Adam/update_SoftmaxLayer/kernel/ResourceApplyAdam/ReadVariableOp_1ReadVariableOpAdam/beta_1*
dtype0*
_output_shapes
: 
Л
GAdam/Adam/update_SoftmaxLayer/kernel/ResourceApplyAdam/ReadVariableOp_2ReadVariableOpAdam/beta_2*
dtype0*
_output_shapes
: 
’
6Adam/Adam/update_SoftmaxLayer/kernel/ResourceApplyAdamResourceApplyAdamSoftmaxLayer/kernelAdam/SoftmaxLayer/kernel/mAdam/SoftmaxLayer/kernel/v(Adam/Adam/update_SoftmaxLayer/kernel/Pow*Adam/Adam/update_SoftmaxLayer/kernel/Pow_1EAdam/Adam/update_SoftmaxLayer/kernel/ResourceApplyAdam/ReadVariableOpGAdam/Adam/update_SoftmaxLayer/kernel/ResourceApplyAdam/ReadVariableOp_1GAdam/Adam/update_SoftmaxLayer/kernel/ResourceApplyAdam/ReadVariableOp_2*Adam/Adam/update_SoftmaxLayer/kernel/Const0Adam/gradients/SoftmaxLayer/MatMul_grad/MatMul_1*
use_nesterov( *
use_locking(*
T0
m
(Adam/Adam/update_SoftmaxLayer/bias/ConstConst*
valueB
 *Хњ÷3*
dtype0*
_output_shapes
: 
s
1Adam/Adam/update_SoftmaxLayer/bias/ReadVariableOpReadVariableOp	Adam/iter*
dtype0	*
_output_shapes
: 
j
(Adam/Adam/update_SoftmaxLayer/bias/add/yConst*
value	B	 R*
dtype0	*
_output_shapes
: 
Ђ
&Adam/Adam/update_SoftmaxLayer/bias/addAdd1Adam/Adam/update_SoftmaxLayer/bias/ReadVariableOp(Adam/Adam/update_SoftmaxLayer/bias/add/y*
_output_shapes
: *
T0	
Ч
'Adam/Adam/update_SoftmaxLayer/bias/CastCast&Adam/Adam/update_SoftmaxLayer/bias/add*

SrcT0	*
Truncate( *
_output_shapes
: *

DstT0
y
5Adam/Adam/update_SoftmaxLayer/bias/Pow/ReadVariableOpReadVariableOpAdam/beta_1*
dtype0*
_output_shapes
: 
Ѓ
&Adam/Adam/update_SoftmaxLayer/bias/PowPow5Adam/Adam/update_SoftmaxLayer/bias/Pow/ReadVariableOp'Adam/Adam/update_SoftmaxLayer/bias/Cast*
T0*
_output_shapes
: 
{
7Adam/Adam/update_SoftmaxLayer/bias/Pow_1/ReadVariableOpReadVariableOpAdam/beta_2*
dtype0*
_output_shapes
: 
≤
(Adam/Adam/update_SoftmaxLayer/bias/Pow_1Pow7Adam/Adam/update_SoftmaxLayer/bias/Pow_1/ReadVariableOp'Adam/Adam/update_SoftmaxLayer/bias/Cast*
_output_shapes
: *
T0
О
CAdam/Adam/update_SoftmaxLayer/bias/ResourceApplyAdam/ReadVariableOpReadVariableOpAdam/learning_rate*
_output_shapes
: *
dtype0
Й
EAdam/Adam/update_SoftmaxLayer/bias/ResourceApplyAdam/ReadVariableOp_1ReadVariableOpAdam/beta_1*
_output_shapes
: *
dtype0
Й
EAdam/Adam/update_SoftmaxLayer/bias/ResourceApplyAdam/ReadVariableOp_2ReadVariableOpAdam/beta_2*
dtype0*
_output_shapes
: 
≈
4Adam/Adam/update_SoftmaxLayer/bias/ResourceApplyAdamResourceApplyAdamSoftmaxLayer/biasAdam/SoftmaxLayer/bias/mAdam/SoftmaxLayer/bias/v&Adam/Adam/update_SoftmaxLayer/bias/Pow(Adam/Adam/update_SoftmaxLayer/bias/Pow_1CAdam/Adam/update_SoftmaxLayer/bias/ResourceApplyAdam/ReadVariableOpEAdam/Adam/update_SoftmaxLayer/bias/ResourceApplyAdam/ReadVariableOp_1EAdam/Adam/update_SoftmaxLayer/bias/ResourceApplyAdam/ReadVariableOp_2(Adam/Adam/update_SoftmaxLayer/bias/Const4Adam/gradients/SoftmaxLayer/BiasAdd_grad/BiasAddGrad*
use_locking(*
T0*
use_nesterov( 
°
Adam/Adam/ConstConst6^Adam/Adam/update_Hidden1Layer1/bias/ResourceApplyAdam8^Adam/Adam/update_Hidden1Layer1/kernel/ResourceApplyAdam5^Adam/Adam/update_HiddenLayer2/bias/ResourceApplyAdam7^Adam/Adam/update_HiddenLayer2/kernel/ResourceApplyAdam5^Adam/Adam/update_SoftmaxLayer/bias/ResourceApplyAdam7^Adam/Adam/update_SoftmaxLayer/kernel/ResourceApplyAdam<^Adam/Adam/update_batch_normalization/beta/ResourceApplyAdam=^Adam/Adam/update_batch_normalization/gamma/ResourceApplyAdam>^Adam/Adam/update_batch_normalization_1/beta/ResourceApplyAdam?^Adam/Adam/update_batch_normalization_1/gamma/ResourceApplyAdam*
_output_shapes
: *
value	B	 R*
dtype0	
]
Adam/Adam/AssignAddVariableOpAssignAddVariableOp	Adam/iterAdam/Adam/Const*
dtype0	
 
Adam/Adam/ReadVariableOpReadVariableOp	Adam/iter^Adam/Adam/AssignAddVariableOp6^Adam/Adam/update_Hidden1Layer1/bias/ResourceApplyAdam8^Adam/Adam/update_Hidden1Layer1/kernel/ResourceApplyAdam5^Adam/Adam/update_HiddenLayer2/bias/ResourceApplyAdam7^Adam/Adam/update_HiddenLayer2/kernel/ResourceApplyAdam5^Adam/Adam/update_SoftmaxLayer/bias/ResourceApplyAdam7^Adam/Adam/update_SoftmaxLayer/kernel/ResourceApplyAdam<^Adam/Adam/update_batch_normalization/beta/ResourceApplyAdam=^Adam/Adam/update_batch_normalization/gamma/ResourceApplyAdam>^Adam/Adam/update_batch_normalization_1/beta/ResourceApplyAdam?^Adam/Adam/update_batch_normalization_1/gamma/ResourceApplyAdam*
dtype0	*
_output_shapes
: 
H
training_1/group_depsNoOp^Adam/Adam/AssignAddVariableOp	^loss/mul
]
VarIsInitializedOp_14VarIsInitializedOpAdam/HiddenLayer2/bias/m*
_output_shapes
: 
J
VarIsInitializedOp_15VarIsInitializedOpcount*
_output_shapes
: 
_
VarIsInitializedOp_16VarIsInitializedOpAdam/HiddenLayer2/kernel/m*
_output_shapes
: 
^
VarIsInitializedOp_17VarIsInitializedOpAdam/Hidden1Layer1/bias/m*
_output_shapes
: 
e
VarIsInitializedOp_18VarIsInitializedOp Adam/batch_normalization/gamma/m*
_output_shapes
: 
`
VarIsInitializedOp_19VarIsInitializedOpAdam/Hidden1Layer1/kernel/m*
_output_shapes
: 
d
VarIsInitializedOp_20VarIsInitializedOpAdam/batch_normalization/beta/m*
_output_shapes
: 
`
VarIsInitializedOp_21VarIsInitializedOpAdam/Hidden1Layer1/kernel/v*
_output_shapes
: 
f
VarIsInitializedOp_22VarIsInitializedOp!Adam/batch_normalization_1/beta/m*
_output_shapes
: 
g
VarIsInitializedOp_23VarIsInitializedOp"Adam/batch_normalization_1/gamma/m*
_output_shapes
: 
J
VarIsInitializedOp_24VarIsInitializedOptotal*
_output_shapes
: 
_
VarIsInitializedOp_25VarIsInitializedOpAdam/SoftmaxLayer/kernel/m*
_output_shapes
: 
]
VarIsInitializedOp_26VarIsInitializedOpAdam/SoftmaxLayer/bias/m*
_output_shapes
: 
f
VarIsInitializedOp_27VarIsInitializedOp!Adam/batch_normalization_1/beta/v*
_output_shapes
: 
^
VarIsInitializedOp_28VarIsInitializedOpAdam/Hidden1Layer1/bias/v*
_output_shapes
: 
e
VarIsInitializedOp_29VarIsInitializedOp Adam/batch_normalization/gamma/v*
_output_shapes
: 
N
VarIsInitializedOp_30VarIsInitializedOp	Adam/iter*
_output_shapes
: 
O
VarIsInitializedOp_31VarIsInitializedOp
Adam/decay*
_output_shapes
: 
P
VarIsInitializedOp_32VarIsInitializedOpAdam/beta_1*
_output_shapes
: 
_
VarIsInitializedOp_33VarIsInitializedOpAdam/SoftmaxLayer/kernel/v*
_output_shapes
: 
g
VarIsInitializedOp_34VarIsInitializedOp"Adam/batch_normalization_1/gamma/v*
_output_shapes
: 
]
VarIsInitializedOp_35VarIsInitializedOpAdam/HiddenLayer2/bias/v*
_output_shapes
: 
_
VarIsInitializedOp_36VarIsInitializedOpAdam/HiddenLayer2/kernel/v*
_output_shapes
: 
P
VarIsInitializedOp_37VarIsInitializedOpAdam/beta_2*
_output_shapes
: 
W
VarIsInitializedOp_38VarIsInitializedOpAdam/learning_rate*
_output_shapes
: 
d
VarIsInitializedOp_39VarIsInitializedOpAdam/batch_normalization/beta/v*
_output_shapes
: 
]
VarIsInitializedOp_40VarIsInitializedOpAdam/SoftmaxLayer/bias/v*
_output_shapes
: 
Х
init_1NoOp!^Adam/Hidden1Layer1/bias/m/Assign!^Adam/Hidden1Layer1/bias/v/Assign#^Adam/Hidden1Layer1/kernel/m/Assign#^Adam/Hidden1Layer1/kernel/v/Assign ^Adam/HiddenLayer2/bias/m/Assign ^Adam/HiddenLayer2/bias/v/Assign"^Adam/HiddenLayer2/kernel/m/Assign"^Adam/HiddenLayer2/kernel/v/Assign ^Adam/SoftmaxLayer/bias/m/Assign ^Adam/SoftmaxLayer/bias/v/Assign"^Adam/SoftmaxLayer/kernel/m/Assign"^Adam/SoftmaxLayer/kernel/v/Assign'^Adam/batch_normalization/beta/m/Assign'^Adam/batch_normalization/beta/v/Assign(^Adam/batch_normalization/gamma/m/Assign(^Adam/batch_normalization/gamma/v/Assign)^Adam/batch_normalization_1/beta/m/Assign)^Adam/batch_normalization_1/beta/v/Assign*^Adam/batch_normalization_1/gamma/m/Assign*^Adam/batch_normalization_1/gamma/v/Assign^Adam/beta_1/Assign^Adam/beta_2/Assign^Adam/decay/Assign^Adam/iter/Assign^Adam/learning_rate/Assign^count/Assign^total/Assign
O
Placeholder_14Placeholder*
dtype0	*
_output_shapes
: *
shape: 
O
AssignVariableOp_14AssignVariableOp	Adam/iterPlaceholder_14*
dtype0	
i
ReadVariableOp_14ReadVariableOp	Adam/iter^AssignVariableOp_14*
dtype0	*
_output_shapes
: 
_
Placeholder_15Placeholder*
dtype0*
_output_shapes

:d*
shape
:d
a
AssignVariableOp_15AssignVariableOpAdam/Hidden1Layer1/kernel/mPlaceholder_15*
dtype0
Г
ReadVariableOp_15ReadVariableOpAdam/Hidden1Layer1/kernel/m^AssignVariableOp_15*
dtype0*
_output_shapes

:d
W
Placeholder_16Placeholder*
dtype0*
_output_shapes
:d*
shape:d
_
AssignVariableOp_16AssignVariableOpAdam/Hidden1Layer1/bias/mPlaceholder_16*
dtype0
}
ReadVariableOp_16ReadVariableOpAdam/Hidden1Layer1/bias/m^AssignVariableOp_16*
dtype0*
_output_shapes
:d
W
Placeholder_17Placeholder*
_output_shapes
:d*
shape:d*
dtype0
f
AssignVariableOp_17AssignVariableOp Adam/batch_normalization/gamma/mPlaceholder_17*
dtype0
Д
ReadVariableOp_17ReadVariableOp Adam/batch_normalization/gamma/m^AssignVariableOp_17*
dtype0*
_output_shapes
:d
W
Placeholder_18Placeholder*
dtype0*
_output_shapes
:d*
shape:d
e
AssignVariableOp_18AssignVariableOpAdam/batch_normalization/beta/mPlaceholder_18*
dtype0
Г
ReadVariableOp_18ReadVariableOpAdam/batch_normalization/beta/m^AssignVariableOp_18*
dtype0*
_output_shapes
:d
_
Placeholder_19Placeholder*
shape
:dd*
dtype0*
_output_shapes

:dd
`
AssignVariableOp_19AssignVariableOpAdam/HiddenLayer2/kernel/mPlaceholder_19*
dtype0
В
ReadVariableOp_19ReadVariableOpAdam/HiddenLayer2/kernel/m^AssignVariableOp_19*
dtype0*
_output_shapes

:dd
W
Placeholder_20Placeholder*
dtype0*
_output_shapes
:d*
shape:d
^
AssignVariableOp_20AssignVariableOpAdam/HiddenLayer2/bias/mPlaceholder_20*
dtype0
|
ReadVariableOp_20ReadVariableOpAdam/HiddenLayer2/bias/m^AssignVariableOp_20*
dtype0*
_output_shapes
:d
W
Placeholder_21Placeholder*
_output_shapes
:d*
shape:d*
dtype0
h
AssignVariableOp_21AssignVariableOp"Adam/batch_normalization_1/gamma/mPlaceholder_21*
dtype0
Ж
ReadVariableOp_21ReadVariableOp"Adam/batch_normalization_1/gamma/m^AssignVariableOp_21*
dtype0*
_output_shapes
:d
W
Placeholder_22Placeholder*
dtype0*
_output_shapes
:d*
shape:d
g
AssignVariableOp_22AssignVariableOp!Adam/batch_normalization_1/beta/mPlaceholder_22*
dtype0
Е
ReadVariableOp_22ReadVariableOp!Adam/batch_normalization_1/beta/m^AssignVariableOp_22*
dtype0*
_output_shapes
:d
_
Placeholder_23Placeholder*
_output_shapes

:d*
shape
:d*
dtype0
`
AssignVariableOp_23AssignVariableOpAdam/SoftmaxLayer/kernel/mPlaceholder_23*
dtype0
В
ReadVariableOp_23ReadVariableOpAdam/SoftmaxLayer/kernel/m^AssignVariableOp_23*
dtype0*
_output_shapes

:d
W
Placeholder_24Placeholder*
dtype0*
_output_shapes
:*
shape:
^
AssignVariableOp_24AssignVariableOpAdam/SoftmaxLayer/bias/mPlaceholder_24*
dtype0
|
ReadVariableOp_24ReadVariableOpAdam/SoftmaxLayer/bias/m^AssignVariableOp_24*
_output_shapes
:*
dtype0
_
Placeholder_25Placeholder*
dtype0*
_output_shapes

:d*
shape
:d
a
AssignVariableOp_25AssignVariableOpAdam/Hidden1Layer1/kernel/vPlaceholder_25*
dtype0
Г
ReadVariableOp_25ReadVariableOpAdam/Hidden1Layer1/kernel/v^AssignVariableOp_25*
dtype0*
_output_shapes

:d
W
Placeholder_26Placeholder*
dtype0*
_output_shapes
:d*
shape:d
_
AssignVariableOp_26AssignVariableOpAdam/Hidden1Layer1/bias/vPlaceholder_26*
dtype0
}
ReadVariableOp_26ReadVariableOpAdam/Hidden1Layer1/bias/v^AssignVariableOp_26*
dtype0*
_output_shapes
:d
W
Placeholder_27Placeholder*
dtype0*
_output_shapes
:d*
shape:d
f
AssignVariableOp_27AssignVariableOp Adam/batch_normalization/gamma/vPlaceholder_27*
dtype0
Д
ReadVariableOp_27ReadVariableOp Adam/batch_normalization/gamma/v^AssignVariableOp_27*
dtype0*
_output_shapes
:d
W
Placeholder_28Placeholder*
_output_shapes
:d*
shape:d*
dtype0
e
AssignVariableOp_28AssignVariableOpAdam/batch_normalization/beta/vPlaceholder_28*
dtype0
Г
ReadVariableOp_28ReadVariableOpAdam/batch_normalization/beta/v^AssignVariableOp_28*
dtype0*
_output_shapes
:d
_
Placeholder_29Placeholder*
dtype0*
_output_shapes

:dd*
shape
:dd
`
AssignVariableOp_29AssignVariableOpAdam/HiddenLayer2/kernel/vPlaceholder_29*
dtype0
В
ReadVariableOp_29ReadVariableOpAdam/HiddenLayer2/kernel/v^AssignVariableOp_29*
dtype0*
_output_shapes

:dd
W
Placeholder_30Placeholder*
dtype0*
_output_shapes
:d*
shape:d
^
AssignVariableOp_30AssignVariableOpAdam/HiddenLayer2/bias/vPlaceholder_30*
dtype0
|
ReadVariableOp_30ReadVariableOpAdam/HiddenLayer2/bias/v^AssignVariableOp_30*
_output_shapes
:d*
dtype0
W
Placeholder_31Placeholder*
dtype0*
_output_shapes
:d*
shape:d
h
AssignVariableOp_31AssignVariableOp"Adam/batch_normalization_1/gamma/vPlaceholder_31*
dtype0
Ж
ReadVariableOp_31ReadVariableOp"Adam/batch_normalization_1/gamma/v^AssignVariableOp_31*
dtype0*
_output_shapes
:d
W
Placeholder_32Placeholder*
shape:d*
dtype0*
_output_shapes
:d
g
AssignVariableOp_32AssignVariableOp!Adam/batch_normalization_1/beta/vPlaceholder_32*
dtype0
Е
ReadVariableOp_32ReadVariableOp!Adam/batch_normalization_1/beta/v^AssignVariableOp_32*
dtype0*
_output_shapes
:d
_
Placeholder_33Placeholder*
dtype0*
_output_shapes

:d*
shape
:d
`
AssignVariableOp_33AssignVariableOpAdam/SoftmaxLayer/kernel/vPlaceholder_33*
dtype0
В
ReadVariableOp_33ReadVariableOpAdam/SoftmaxLayer/kernel/v^AssignVariableOp_33*
dtype0*
_output_shapes

:d
W
Placeholder_34Placeholder*
dtype0*
_output_shapes
:*
shape:
^
AssignVariableOp_34AssignVariableOpAdam/SoftmaxLayer/bias/vPlaceholder_34*
dtype0
|
ReadVariableOp_34ReadVariableOpAdam/SoftmaxLayer/bias/v^AssignVariableOp_34*
dtype0*
_output_shapes
:
Y
save/filename/inputConst*
valueB Bmodel*
dtype0*
_output_shapes
: 
n
save/filenamePlaceholderWithDefaultsave/filename/input*
dtype0*
_output_shapes
: *
shape: 
e

save/ConstPlaceholderWithDefaultsave/filename*
dtype0*
_output_shapes
: *
shape: 
Д
save/StringJoin/inputs_1Const*<
value3B1 B+_temp_0beb5f9f56ba497584452c13955df53a/part*
dtype0*
_output_shapes
: 
u
save/StringJoin
StringJoin
save/Constsave/StringJoin/inputs_1*
N*
_output_shapes
: *
	separator 
Q
save/num_shardsConst*
value	B :*
dtype0*
_output_shapes
: 
k
save/ShardedFilename/shardConst"/device:CPU:0*
_output_shapes
: *
value	B : *
dtype0
М
save/ShardedFilenameShardedFilenamesave/StringJoinsave/ShardedFilename/shardsave/num_shards"/device:CPU:0*
_output_shapes
: 
К	
save/SaveV2/tensor_namesConst"/device:CPU:0*Ѓ
value§B°'BAdam/Hidden1Layer1/bias/mBAdam/Hidden1Layer1/bias/vBAdam/Hidden1Layer1/kernel/mBAdam/Hidden1Layer1/kernel/vBAdam/HiddenLayer2/bias/mBAdam/HiddenLayer2/bias/vBAdam/HiddenLayer2/kernel/mBAdam/HiddenLayer2/kernel/vBAdam/SoftmaxLayer/bias/mBAdam/SoftmaxLayer/bias/vBAdam/SoftmaxLayer/kernel/mBAdam/SoftmaxLayer/kernel/vBAdam/batch_normalization/beta/mBAdam/batch_normalization/beta/vB Adam/batch_normalization/gamma/mB Adam/batch_normalization/gamma/vB!Adam/batch_normalization_1/beta/mB!Adam/batch_normalization_1/beta/vB"Adam/batch_normalization_1/gamma/mB"Adam/batch_normalization_1/gamma/vBAdam/beta_1BAdam/beta_2B
Adam/decayB	Adam/iterBAdam/learning_rateBHidden1Layer1/biasBHidden1Layer1/kernelBHiddenLayer2/biasBHiddenLayer2/kernelBSoftmaxLayer/biasBSoftmaxLayer/kernelBbatch_normalization/betaBbatch_normalization/gammaBbatch_normalization/moving_meanB#batch_normalization/moving_varianceBbatch_normalization_1/betaBbatch_normalization_1/gammaB!batch_normalization_1/moving_meanB%batch_normalization_1/moving_variance*
dtype0*
_output_shapes
:'
ј
save/SaveV2/shape_and_slicesConst"/device:CPU:0*
dtype0*
_output_shapes
:'*a
valueXBV'B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B 
ќ
save/SaveV2SaveV2save/ShardedFilenamesave/SaveV2/tensor_namessave/SaveV2/shape_and_slices-Adam/Hidden1Layer1/bias/m/Read/ReadVariableOp-Adam/Hidden1Layer1/bias/v/Read/ReadVariableOp/Adam/Hidden1Layer1/kernel/m/Read/ReadVariableOp/Adam/Hidden1Layer1/kernel/v/Read/ReadVariableOp,Adam/HiddenLayer2/bias/m/Read/ReadVariableOp,Adam/HiddenLayer2/bias/v/Read/ReadVariableOp.Adam/HiddenLayer2/kernel/m/Read/ReadVariableOp.Adam/HiddenLayer2/kernel/v/Read/ReadVariableOp,Adam/SoftmaxLayer/bias/m/Read/ReadVariableOp,Adam/SoftmaxLayer/bias/v/Read/ReadVariableOp.Adam/SoftmaxLayer/kernel/m/Read/ReadVariableOp.Adam/SoftmaxLayer/kernel/v/Read/ReadVariableOp3Adam/batch_normalization/beta/m/Read/ReadVariableOp3Adam/batch_normalization/beta/v/Read/ReadVariableOp4Adam/batch_normalization/gamma/m/Read/ReadVariableOp4Adam/batch_normalization/gamma/v/Read/ReadVariableOp5Adam/batch_normalization_1/beta/m/Read/ReadVariableOp5Adam/batch_normalization_1/beta/v/Read/ReadVariableOp6Adam/batch_normalization_1/gamma/m/Read/ReadVariableOp6Adam/batch_normalization_1/gamma/v/Read/ReadVariableOpAdam/beta_1/Read/ReadVariableOpAdam/beta_2/Read/ReadVariableOpAdam/decay/Read/ReadVariableOpAdam/iter/Read/ReadVariableOp&Adam/learning_rate/Read/ReadVariableOp&Hidden1Layer1/bias/Read/ReadVariableOp(Hidden1Layer1/kernel/Read/ReadVariableOp%HiddenLayer2/bias/Read/ReadVariableOp'HiddenLayer2/kernel/Read/ReadVariableOp%SoftmaxLayer/bias/Read/ReadVariableOp'SoftmaxLayer/kernel/Read/ReadVariableOp,batch_normalization/beta/Read/ReadVariableOp-batch_normalization/gamma/Read/ReadVariableOp3batch_normalization/moving_mean/Read/ReadVariableOp7batch_normalization/moving_variance/Read/ReadVariableOp.batch_normalization_1/beta/Read/ReadVariableOp/batch_normalization_1/gamma/Read/ReadVariableOp5batch_normalization_1/moving_mean/Read/ReadVariableOp9batch_normalization_1/moving_variance/Read/ReadVariableOp"/device:CPU:0*5
dtypes+
)2'	
†
save/control_dependencyIdentitysave/ShardedFilename^save/SaveV2"/device:CPU:0*
_output_shapes
: *
T0*'
_class
loc:@save/ShardedFilename
ђ
+save/MergeV2Checkpoints/checkpoint_prefixesPacksave/ShardedFilename^save/control_dependency"/device:CPU:0*
T0*

axis *
N*
_output_shapes
:
М
save/MergeV2CheckpointsMergeV2Checkpoints+save/MergeV2Checkpoints/checkpoint_prefixes
save/Const"/device:CPU:0*
delete_old_dirs(
Й
save/IdentityIdentity
save/Const^save/MergeV2Checkpoints^save/control_dependency"/device:CPU:0*
_output_shapes
: *
T0
Н	
save/RestoreV2/tensor_namesConst"/device:CPU:0*
dtype0*
_output_shapes
:'*Ѓ
value§B°'BAdam/Hidden1Layer1/bias/mBAdam/Hidden1Layer1/bias/vBAdam/Hidden1Layer1/kernel/mBAdam/Hidden1Layer1/kernel/vBAdam/HiddenLayer2/bias/mBAdam/HiddenLayer2/bias/vBAdam/HiddenLayer2/kernel/mBAdam/HiddenLayer2/kernel/vBAdam/SoftmaxLayer/bias/mBAdam/SoftmaxLayer/bias/vBAdam/SoftmaxLayer/kernel/mBAdam/SoftmaxLayer/kernel/vBAdam/batch_normalization/beta/mBAdam/batch_normalization/beta/vB Adam/batch_normalization/gamma/mB Adam/batch_normalization/gamma/vB!Adam/batch_normalization_1/beta/mB!Adam/batch_normalization_1/beta/vB"Adam/batch_normalization_1/gamma/mB"Adam/batch_normalization_1/gamma/vBAdam/beta_1BAdam/beta_2B
Adam/decayB	Adam/iterBAdam/learning_rateBHidden1Layer1/biasBHidden1Layer1/kernelBHiddenLayer2/biasBHiddenLayer2/kernelBSoftmaxLayer/biasBSoftmaxLayer/kernelBbatch_normalization/betaBbatch_normalization/gammaBbatch_normalization/moving_meanB#batch_normalization/moving_varianceBbatch_normalization_1/betaBbatch_normalization_1/gammaB!batch_normalization_1/moving_meanB%batch_normalization_1/moving_variance
√
save/RestoreV2/shape_and_slicesConst"/device:CPU:0*a
valueXBV'B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B *
dtype0*
_output_shapes
:'
а
save/RestoreV2	RestoreV2
save/Constsave/RestoreV2/tensor_namessave/RestoreV2/shape_and_slices"/device:CPU:0*≤
_output_shapesЯ
Ь:::::::::::::::::::::::::::::::::::::::*5
dtypes+
)2'	
N
save/Identity_1Identitysave/RestoreV2*
T0*
_output_shapes
:
b
save/AssignVariableOpAssignVariableOpAdam/Hidden1Layer1/bias/msave/Identity_1*
dtype0
P
save/Identity_2Identitysave/RestoreV2:1*
T0*
_output_shapes
:
d
save/AssignVariableOp_1AssignVariableOpAdam/Hidden1Layer1/bias/vsave/Identity_2*
dtype0
P
save/Identity_3Identitysave/RestoreV2:2*
T0*
_output_shapes
:
f
save/AssignVariableOp_2AssignVariableOpAdam/Hidden1Layer1/kernel/msave/Identity_3*
dtype0
P
save/Identity_4Identitysave/RestoreV2:3*
T0*
_output_shapes
:
f
save/AssignVariableOp_3AssignVariableOpAdam/Hidden1Layer1/kernel/vsave/Identity_4*
dtype0
P
save/Identity_5Identitysave/RestoreV2:4*
_output_shapes
:*
T0
c
save/AssignVariableOp_4AssignVariableOpAdam/HiddenLayer2/bias/msave/Identity_5*
dtype0
P
save/Identity_6Identitysave/RestoreV2:5*
T0*
_output_shapes
:
c
save/AssignVariableOp_5AssignVariableOpAdam/HiddenLayer2/bias/vsave/Identity_6*
dtype0
P
save/Identity_7Identitysave/RestoreV2:6*
T0*
_output_shapes
:
e
save/AssignVariableOp_6AssignVariableOpAdam/HiddenLayer2/kernel/msave/Identity_7*
dtype0
P
save/Identity_8Identitysave/RestoreV2:7*
T0*
_output_shapes
:
e
save/AssignVariableOp_7AssignVariableOpAdam/HiddenLayer2/kernel/vsave/Identity_8*
dtype0
P
save/Identity_9Identitysave/RestoreV2:8*
T0*
_output_shapes
:
c
save/AssignVariableOp_8AssignVariableOpAdam/SoftmaxLayer/bias/msave/Identity_9*
dtype0
Q
save/Identity_10Identitysave/RestoreV2:9*
T0*
_output_shapes
:
d
save/AssignVariableOp_9AssignVariableOpAdam/SoftmaxLayer/bias/vsave/Identity_10*
dtype0
R
save/Identity_11Identitysave/RestoreV2:10*
T0*
_output_shapes
:
g
save/AssignVariableOp_10AssignVariableOpAdam/SoftmaxLayer/kernel/msave/Identity_11*
dtype0
R
save/Identity_12Identitysave/RestoreV2:11*
T0*
_output_shapes
:
g
save/AssignVariableOp_11AssignVariableOpAdam/SoftmaxLayer/kernel/vsave/Identity_12*
dtype0
R
save/Identity_13Identitysave/RestoreV2:12*
T0*
_output_shapes
:
l
save/AssignVariableOp_12AssignVariableOpAdam/batch_normalization/beta/msave/Identity_13*
dtype0
R
save/Identity_14Identitysave/RestoreV2:13*
_output_shapes
:*
T0
l
save/AssignVariableOp_13AssignVariableOpAdam/batch_normalization/beta/vsave/Identity_14*
dtype0
R
save/Identity_15Identitysave/RestoreV2:14*
_output_shapes
:*
T0
m
save/AssignVariableOp_14AssignVariableOp Adam/batch_normalization/gamma/msave/Identity_15*
dtype0
R
save/Identity_16Identitysave/RestoreV2:15*
T0*
_output_shapes
:
m
save/AssignVariableOp_15AssignVariableOp Adam/batch_normalization/gamma/vsave/Identity_16*
dtype0
R
save/Identity_17Identitysave/RestoreV2:16*
T0*
_output_shapes
:
n
save/AssignVariableOp_16AssignVariableOp!Adam/batch_normalization_1/beta/msave/Identity_17*
dtype0
R
save/Identity_18Identitysave/RestoreV2:17*
T0*
_output_shapes
:
n
save/AssignVariableOp_17AssignVariableOp!Adam/batch_normalization_1/beta/vsave/Identity_18*
dtype0
R
save/Identity_19Identitysave/RestoreV2:18*
T0*
_output_shapes
:
o
save/AssignVariableOp_18AssignVariableOp"Adam/batch_normalization_1/gamma/msave/Identity_19*
dtype0
R
save/Identity_20Identitysave/RestoreV2:19*
_output_shapes
:*
T0
o
save/AssignVariableOp_19AssignVariableOp"Adam/batch_normalization_1/gamma/vsave/Identity_20*
dtype0
R
save/Identity_21Identitysave/RestoreV2:20*
T0*
_output_shapes
:
X
save/AssignVariableOp_20AssignVariableOpAdam/beta_1save/Identity_21*
dtype0
R
save/Identity_22Identitysave/RestoreV2:21*
_output_shapes
:*
T0
X
save/AssignVariableOp_21AssignVariableOpAdam/beta_2save/Identity_22*
dtype0
R
save/Identity_23Identitysave/RestoreV2:22*
T0*
_output_shapes
:
W
save/AssignVariableOp_22AssignVariableOp
Adam/decaysave/Identity_23*
dtype0
R
save/Identity_24Identitysave/RestoreV2:23*
T0	*
_output_shapes
:
V
save/AssignVariableOp_23AssignVariableOp	Adam/itersave/Identity_24*
dtype0	
R
save/Identity_25Identitysave/RestoreV2:24*
T0*
_output_shapes
:
_
save/AssignVariableOp_24AssignVariableOpAdam/learning_ratesave/Identity_25*
dtype0
R
save/Identity_26Identitysave/RestoreV2:25*
T0*
_output_shapes
:
_
save/AssignVariableOp_25AssignVariableOpHidden1Layer1/biassave/Identity_26*
dtype0
R
save/Identity_27Identitysave/RestoreV2:26*
_output_shapes
:*
T0
a
save/AssignVariableOp_26AssignVariableOpHidden1Layer1/kernelsave/Identity_27*
dtype0
R
save/Identity_28Identitysave/RestoreV2:27*
_output_shapes
:*
T0
^
save/AssignVariableOp_27AssignVariableOpHiddenLayer2/biassave/Identity_28*
dtype0
R
save/Identity_29Identitysave/RestoreV2:28*
T0*
_output_shapes
:
`
save/AssignVariableOp_28AssignVariableOpHiddenLayer2/kernelsave/Identity_29*
dtype0
R
save/Identity_30Identitysave/RestoreV2:29*
_output_shapes
:*
T0
^
save/AssignVariableOp_29AssignVariableOpSoftmaxLayer/biassave/Identity_30*
dtype0
R
save/Identity_31Identitysave/RestoreV2:30*
T0*
_output_shapes
:
`
save/AssignVariableOp_30AssignVariableOpSoftmaxLayer/kernelsave/Identity_31*
dtype0
R
save/Identity_32Identitysave/RestoreV2:31*
T0*
_output_shapes
:
e
save/AssignVariableOp_31AssignVariableOpbatch_normalization/betasave/Identity_32*
dtype0
R
save/Identity_33Identitysave/RestoreV2:32*
T0*
_output_shapes
:
f
save/AssignVariableOp_32AssignVariableOpbatch_normalization/gammasave/Identity_33*
dtype0
R
save/Identity_34Identitysave/RestoreV2:33*
T0*
_output_shapes
:
l
save/AssignVariableOp_33AssignVariableOpbatch_normalization/moving_meansave/Identity_34*
dtype0
R
save/Identity_35Identitysave/RestoreV2:34*
T0*
_output_shapes
:
p
save/AssignVariableOp_34AssignVariableOp#batch_normalization/moving_variancesave/Identity_35*
dtype0
R
save/Identity_36Identitysave/RestoreV2:35*
T0*
_output_shapes
:
g
save/AssignVariableOp_35AssignVariableOpbatch_normalization_1/betasave/Identity_36*
dtype0
R
save/Identity_37Identitysave/RestoreV2:36*
T0*
_output_shapes
:
h
save/AssignVariableOp_36AssignVariableOpbatch_normalization_1/gammasave/Identity_37*
dtype0
R
save/Identity_38Identitysave/RestoreV2:37*
T0*
_output_shapes
:
n
save/AssignVariableOp_37AssignVariableOp!batch_normalization_1/moving_meansave/Identity_38*
dtype0
R
save/Identity_39Identitysave/RestoreV2:38*
_output_shapes
:*
T0
r
save/AssignVariableOp_38AssignVariableOp%batch_normalization_1/moving_variancesave/Identity_39*
dtype0
Ђ
save/restore_shardNoOp^save/AssignVariableOp^save/AssignVariableOp_1^save/AssignVariableOp_10^save/AssignVariableOp_11^save/AssignVariableOp_12^save/AssignVariableOp_13^save/AssignVariableOp_14^save/AssignVariableOp_15^save/AssignVariableOp_16^save/AssignVariableOp_17^save/AssignVariableOp_18^save/AssignVariableOp_19^save/AssignVariableOp_2^save/AssignVariableOp_20^save/AssignVariableOp_21^save/AssignVariableOp_22^save/AssignVariableOp_23^save/AssignVariableOp_24^save/AssignVariableOp_25^save/AssignVariableOp_26^save/AssignVariableOp_27^save/AssignVariableOp_28^save/AssignVariableOp_29^save/AssignVariableOp_3^save/AssignVariableOp_30^save/AssignVariableOp_31^save/AssignVariableOp_32^save/AssignVariableOp_33^save/AssignVariableOp_34^save/AssignVariableOp_35^save/AssignVariableOp_36^save/AssignVariableOp_37^save/AssignVariableOp_38^save/AssignVariableOp_4^save/AssignVariableOp_5^save/AssignVariableOp_6^save/AssignVariableOp_7^save/AssignVariableOp_8^save/AssignVariableOp_9
-
save/restore_allNoOp^save/restore_shard"&<
save/Const:0save/Identity:0save/restore_all (5 @F8"Ш
trainable_variablesАэ
Ш
Hidden1Layer1/kernel:0Hidden1Layer1/kernel/Assign*Hidden1Layer1/kernel/Read/ReadVariableOp:0(21Hidden1Layer1/kernel/Initializer/random_uniform:08
З
Hidden1Layer1/bias:0Hidden1Layer1/bias/Assign(Hidden1Layer1/bias/Read/ReadVariableOp:0(2&Hidden1Layer1/bias/Initializer/zeros:08
Ґ
batch_normalization/gamma:0 batch_normalization/gamma/Assign/batch_normalization/gamma/Read/ReadVariableOp:0(2,batch_normalization/gamma/Initializer/ones:08
Я
batch_normalization/beta:0batch_normalization/beta/Assign.batch_normalization/beta/Read/ReadVariableOp:0(2,batch_normalization/beta/Initializer/zeros:08
Ф
HiddenLayer2/kernel:0HiddenLayer2/kernel/Assign)HiddenLayer2/kernel/Read/ReadVariableOp:0(20HiddenLayer2/kernel/Initializer/random_uniform:08
Г
HiddenLayer2/bias:0HiddenLayer2/bias/Assign'HiddenLayer2/bias/Read/ReadVariableOp:0(2%HiddenLayer2/bias/Initializer/zeros:08
™
batch_normalization_1/gamma:0"batch_normalization_1/gamma/Assign1batch_normalization_1/gamma/Read/ReadVariableOp:0(2.batch_normalization_1/gamma/Initializer/ones:08
І
batch_normalization_1/beta:0!batch_normalization_1/beta/Assign0batch_normalization_1/beta/Read/ReadVariableOp:0(2.batch_normalization_1/beta/Initializer/zeros:08
Ф
SoftmaxLayer/kernel:0SoftmaxLayer/kernel/Assign)SoftmaxLayer/kernel/Read/ReadVariableOp:0(20SoftmaxLayer/kernel/Initializer/random_uniform:08
Г
SoftmaxLayer/bias:0SoftmaxLayer/bias/Assign'SoftmaxLayer/bias/Read/ReadVariableOp:0(2%SoftmaxLayer/bias/Initializer/zeros:08"ё2
	variables–2Ќ2
Ш
Hidden1Layer1/kernel:0Hidden1Layer1/kernel/Assign*Hidden1Layer1/kernel/Read/ReadVariableOp:0(21Hidden1Layer1/kernel/Initializer/random_uniform:08
З
Hidden1Layer1/bias:0Hidden1Layer1/bias/Assign(Hidden1Layer1/bias/Read/ReadVariableOp:0(2&Hidden1Layer1/bias/Initializer/zeros:08
Ґ
batch_normalization/gamma:0 batch_normalization/gamma/Assign/batch_normalization/gamma/Read/ReadVariableOp:0(2,batch_normalization/gamma/Initializer/ones:08
Я
batch_normalization/beta:0batch_normalization/beta/Assign.batch_normalization/beta/Read/ReadVariableOp:0(2,batch_normalization/beta/Initializer/zeros:08
љ
!batch_normalization/moving_mean:0&batch_normalization/moving_mean/Assign5batch_normalization/moving_mean/Read/ReadVariableOp:0(23batch_normalization/moving_mean/Initializer/zeros:0@H
ћ
%batch_normalization/moving_variance:0*batch_normalization/moving_variance/Assign9batch_normalization/moving_variance/Read/ReadVariableOp:0(26batch_normalization/moving_variance/Initializer/ones:0@H
Ф
HiddenLayer2/kernel:0HiddenLayer2/kernel/Assign)HiddenLayer2/kernel/Read/ReadVariableOp:0(20HiddenLayer2/kernel/Initializer/random_uniform:08
Г
HiddenLayer2/bias:0HiddenLayer2/bias/Assign'HiddenLayer2/bias/Read/ReadVariableOp:0(2%HiddenLayer2/bias/Initializer/zeros:08
™
batch_normalization_1/gamma:0"batch_normalization_1/gamma/Assign1batch_normalization_1/gamma/Read/ReadVariableOp:0(2.batch_normalization_1/gamma/Initializer/ones:08
І
batch_normalization_1/beta:0!batch_normalization_1/beta/Assign0batch_normalization_1/beta/Read/ReadVariableOp:0(2.batch_normalization_1/beta/Initializer/zeros:08
≈
#batch_normalization_1/moving_mean:0(batch_normalization_1/moving_mean/Assign7batch_normalization_1/moving_mean/Read/ReadVariableOp:0(25batch_normalization_1/moving_mean/Initializer/zeros:0@H
‘
'batch_normalization_1/moving_variance:0,batch_normalization_1/moving_variance/Assign;batch_normalization_1/moving_variance/Read/ReadVariableOp:0(28batch_normalization_1/moving_variance/Initializer/ones:0@H
Ф
SoftmaxLayer/kernel:0SoftmaxLayer/kernel/Assign)SoftmaxLayer/kernel/Read/ReadVariableOp:0(20SoftmaxLayer/kernel/Initializer/random_uniform:08
Г
SoftmaxLayer/bias:0SoftmaxLayer/bias/Assign'SoftmaxLayer/bias/Read/ReadVariableOp:0(2%SoftmaxLayer/bias/Initializer/zeros:08
c
Adam/iter:0Adam/iter/AssignAdam/iter/Read/ReadVariableOp:0(2Adam/iter/Initializer/zeros:0H
s
Adam/beta_1:0Adam/beta_1/Assign!Adam/beta_1/Read/ReadVariableOp:0(2'Adam/beta_1/Initializer/initial_value:0H
s
Adam/beta_2:0Adam/beta_2/Assign!Adam/beta_2/Read/ReadVariableOp:0(2'Adam/beta_2/Initializer/initial_value:0H
o
Adam/decay:0Adam/decay/Assign Adam/decay/Read/ReadVariableOp:0(2&Adam/decay/Initializer/initial_value:0H
П
Adam/learning_rate:0Adam/learning_rate/Assign(Adam/learning_rate/Read/ReadVariableOp:0(2.Adam/learning_rate/Initializer/initial_value:0H
©
Adam/Hidden1Layer1/kernel/m:0"Adam/Hidden1Layer1/kernel/m/Assign1Adam/Hidden1Layer1/kernel/m/Read/ReadVariableOp:0(2/Adam/Hidden1Layer1/kernel/m/Initializer/zeros:0
°
Adam/Hidden1Layer1/bias/m:0 Adam/Hidden1Layer1/bias/m/Assign/Adam/Hidden1Layer1/bias/m/Read/ReadVariableOp:0(2-Adam/Hidden1Layer1/bias/m/Initializer/zeros:0
љ
"Adam/batch_normalization/gamma/m:0'Adam/batch_normalization/gamma/m/Assign6Adam/batch_normalization/gamma/m/Read/ReadVariableOp:0(24Adam/batch_normalization/gamma/m/Initializer/zeros:0
є
!Adam/batch_normalization/beta/m:0&Adam/batch_normalization/beta/m/Assign5Adam/batch_normalization/beta/m/Read/ReadVariableOp:0(23Adam/batch_normalization/beta/m/Initializer/zeros:0
•
Adam/HiddenLayer2/kernel/m:0!Adam/HiddenLayer2/kernel/m/Assign0Adam/HiddenLayer2/kernel/m/Read/ReadVariableOp:0(2.Adam/HiddenLayer2/kernel/m/Initializer/zeros:0
Э
Adam/HiddenLayer2/bias/m:0Adam/HiddenLayer2/bias/m/Assign.Adam/HiddenLayer2/bias/m/Read/ReadVariableOp:0(2,Adam/HiddenLayer2/bias/m/Initializer/zeros:0
≈
$Adam/batch_normalization_1/gamma/m:0)Adam/batch_normalization_1/gamma/m/Assign8Adam/batch_normalization_1/gamma/m/Read/ReadVariableOp:0(26Adam/batch_normalization_1/gamma/m/Initializer/zeros:0
Ѕ
#Adam/batch_normalization_1/beta/m:0(Adam/batch_normalization_1/beta/m/Assign7Adam/batch_normalization_1/beta/m/Read/ReadVariableOp:0(25Adam/batch_normalization_1/beta/m/Initializer/zeros:0
•
Adam/SoftmaxLayer/kernel/m:0!Adam/SoftmaxLayer/kernel/m/Assign0Adam/SoftmaxLayer/kernel/m/Read/ReadVariableOp:0(2.Adam/SoftmaxLayer/kernel/m/Initializer/zeros:0
Э
Adam/SoftmaxLayer/bias/m:0Adam/SoftmaxLayer/bias/m/Assign.Adam/SoftmaxLayer/bias/m/Read/ReadVariableOp:0(2,Adam/SoftmaxLayer/bias/m/Initializer/zeros:0
©
Adam/Hidden1Layer1/kernel/v:0"Adam/Hidden1Layer1/kernel/v/Assign1Adam/Hidden1Layer1/kernel/v/Read/ReadVariableOp:0(2/Adam/Hidden1Layer1/kernel/v/Initializer/zeros:0
°
Adam/Hidden1Layer1/bias/v:0 Adam/Hidden1Layer1/bias/v/Assign/Adam/Hidden1Layer1/bias/v/Read/ReadVariableOp:0(2-Adam/Hidden1Layer1/bias/v/Initializer/zeros:0
љ
"Adam/batch_normalization/gamma/v:0'Adam/batch_normalization/gamma/v/Assign6Adam/batch_normalization/gamma/v/Read/ReadVariableOp:0(24Adam/batch_normalization/gamma/v/Initializer/zeros:0
є
!Adam/batch_normalization/beta/v:0&Adam/batch_normalization/beta/v/Assign5Adam/batch_normalization/beta/v/Read/ReadVariableOp:0(23Adam/batch_normalization/beta/v/Initializer/zeros:0
•
Adam/HiddenLayer2/kernel/v:0!Adam/HiddenLayer2/kernel/v/Assign0Adam/HiddenLayer2/kernel/v/Read/ReadVariableOp:0(2.Adam/HiddenLayer2/kernel/v/Initializer/zeros:0
Э
Adam/HiddenLayer2/bias/v:0Adam/HiddenLayer2/bias/v/Assign.Adam/HiddenLayer2/bias/v/Read/ReadVariableOp:0(2,Adam/HiddenLayer2/bias/v/Initializer/zeros:0
≈
$Adam/batch_normalization_1/gamma/v:0)Adam/batch_normalization_1/gamma/v/Assign8Adam/batch_normalization_1/gamma/v/Read/ReadVariableOp:0(26Adam/batch_normalization_1/gamma/v/Initializer/zeros:0
Ѕ
#Adam/batch_normalization_1/beta/v:0(Adam/batch_normalization_1/beta/v/Assign7Adam/batch_normalization_1/beta/v/Read/ReadVariableOp:0(25Adam/batch_normalization_1/beta/v/Initializer/zeros:0
•
Adam/SoftmaxLayer/kernel/v:0!Adam/SoftmaxLayer/kernel/v/Assign0Adam/SoftmaxLayer/kernel/v/Read/ReadVariableOp:0(2.Adam/SoftmaxLayer/kernel/v/Initializer/zeros:0
Э
Adam/SoftmaxLayer/bias/v:0Adam/SoftmaxLayer/bias/v/Assign.Adam/SoftmaxLayer/bias/v/Read/ReadVariableOp:0(2,Adam/SoftmaxLayer/bias/v/Initializer/zeros:0*Щ
predictН
6
images,
Hidden1Layer1_input:0€€€€€€€€€7
scores-
SoftmaxLayer/Softmax:0€€€€€€€€€tensorflow/serving/predict
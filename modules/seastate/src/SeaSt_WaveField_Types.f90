!STARTOFREGISTRYGENERATEDFILE 'SeaSt_WaveField_Types.f90'
!
! WARNING This file is generated automatically by the FAST registry.
! Do not edit.  Your changes to this file will be lost.
!
! FAST Registry
!*********************************************************************************************************************************
! SeaSt_WaveField_Types
!.................................................................................................................................
! This file is part of SeaSt_WaveField.
!
! Copyright (C) 2012-2016 National Renewable Energy Laboratory
!
! Licensed under the Apache License, Version 2.0 (the "License");
! you may not use this file except in compliance with the License.
! You may obtain a copy of the License at
!
!     http://www.apache.org/licenses/LICENSE-2.0
!
! Unless required by applicable law or agreed to in writing, software
! distributed under the License is distributed on an "AS IS" BASIS,
! WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
! See the License for the specific language governing permissions and
! limitations under the License.
!
!
! W A R N I N G : This file was automatically generated from the FAST registry.  Changes made to this file may be lost.
!
!*********************************************************************************************************************************
!> This module contains the user-defined types needed in SeaSt_WaveField. It also contains copy, destroy, pack, and
!! unpack routines associated with each defined data type. This code is automatically generated by the FAST Registry.
MODULE SeaSt_WaveField_Types
!---------------------------------------------------------------------------------------------------------------------------------
USE SeaState_Interp_Types
USE NWTC_Library
IMPLICIT NONE
! =========  SeaSt_WaveFieldType  =======
  TYPE, PUBLIC :: SeaSt_WaveFieldType
    REAL(SiKi) , DIMENSION(:), ALLOCATABLE  :: WaveTime      !< Time array [(s)]
    REAL(SiKi) , DIMENSION(:,:,:,:), ALLOCATABLE  :: WaveDynP      !< Incident wave dynamic pressure [(N/m^2)]
    REAL(SiKi) , DIMENSION(:,:,:,:,:), ALLOCATABLE  :: WaveAcc      !< Incident wave acceleration [(m/s^2)]
    REAL(SiKi) , DIMENSION(:,:,:,:,:), ALLOCATABLE  :: WaveAccMCF      !< Scaled acceleration for MacCamy-Fuchs members [(m/s^2)]
    REAL(SiKi) , DIMENSION(:,:,:,:,:), ALLOCATABLE  :: WaveVel      !< Incident wave velocity [(m/s)]
    REAL(SiKi) , DIMENSION(:,:,:), ALLOCATABLE  :: PWaveDynP0      !< Partial derivative of dynamic pressure in the vertical direction at the still water level [(Pa/m)]
    REAL(SiKi) , DIMENSION(:,:,:,:), ALLOCATABLE  :: PWaveAcc0      !< Partial derivative of incident wave acceleration in the vertical direction at the still water level [(m/s^2/m)]
    REAL(SiKi) , DIMENSION(:,:,:,:), ALLOCATABLE  :: PWaveAccMCF0      !< Partial derivative of scaled wave acceleration in the vertical direction at the still water level for MacCamy-Fuchs members [(m/s^2/m)]
    REAL(SiKi) , DIMENSION(:,:,:,:), ALLOCATABLE  :: PWaveVel0      !< Partial derivative of incident wave velocity in the vertical direction at the still water level [(m/s/m)]
    REAL(SiKi) , DIMENSION(:), ALLOCATABLE  :: WaveElev0      !< Instantaneous elevation time-series of incident waves at the platform reference point (NOTE THAT THIS CAN GET MODIFIED IN WAMIT) [(m)]
    REAL(SiKi) , DIMENSION(:,:,:), ALLOCATABLE  :: WaveElev1      !< First order wave elevation [(m)]
    REAL(SiKi) , DIMENSION(:,:,:), ALLOCATABLE  :: WaveElev2      !< Second order wave elevation [(m)]
    TYPE(SeaSt_Interp_ParameterType)  :: SeaSt_Interp_p      !< Parameter information from the SeaState Interpolation module [(-)]
    INTEGER(IntKi)  :: WaveStMod = 0_IntKi      !< Wave stretching model [-]
    REAL(ReKi)  :: EffWtrDpth = 0.0_ReKi      !< Water depth [(-)]
    REAL(ReKi)  :: MSL2SWL = 0.0_ReKi      !< Vertical distance from mean sea level to still water level [(m)]
    REAL(SiKi) , DIMENSION(:,:,:), ALLOCATABLE  :: WaveElevC      !< Discrete Fourier transform of the instantaneous elevation of incident waves at all grid points.  First column is real part, second column is imaginary part [(m)]
    REAL(SiKi) , DIMENSION(:,:), ALLOCATABLE  :: WaveElevC0      !< Fourier components of the incident wave elevation at the platform reference point. First column is the real part; second column is the imaginary part [(m)]
    REAL(SiKi) , DIMENSION(:), ALLOCATABLE  :: WaveDirArr      !< Wave direction array. Each frequency has a unique direction of WaveNDir > 1 [(degrees)]
    REAL(ReKi)  :: WtrDens = 0.0_ReKi      !< Water density, this is necessary to inform glue-code what the module is using for WtrDens (may not be the glue-code's default) [(kg/m^3)]
    REAL(SiKi)  :: RhoXg = 0.0_R4Ki      !< = WtrDens*Gravity [-]
    REAL(SiKi)  :: WaveDirMin = 0.0_R4Ki      !< Minimum wave direction. [(degrees)]
    REAL(SiKi)  :: WaveDirMax = 0.0_R4Ki      !< Maximum wave direction. [(degrees)]
    REAL(SiKi)  :: WaveDir = 0.0_R4Ki      !< Incident wave propagation heading direction [(degrees)]
    LOGICAL  :: WaveMultiDir = .false.      !< Indicates the waves are multidirectional -- set by HydroDyn_Input [-]
  END TYPE SeaSt_WaveFieldType
! =======================
CONTAINS

subroutine SeaSt_WaveField_CopySeaSt_WaveFieldType(SrcSeaSt_WaveFieldTypeData, DstSeaSt_WaveFieldTypeData, CtrlCode, ErrStat, ErrMsg)
   type(SeaSt_WaveFieldType), intent(in) :: SrcSeaSt_WaveFieldTypeData
   type(SeaSt_WaveFieldType), intent(inout) :: DstSeaSt_WaveFieldTypeData
   integer(IntKi),  intent(in   ) :: CtrlCode
   integer(IntKi),  intent(  out) :: ErrStat
   character(*),    intent(  out) :: ErrMsg
   integer(IntKi)                 :: LB(5), UB(5)
   integer(IntKi)                 :: ErrStat2
   character(ErrMsgLen)           :: ErrMsg2
   character(*), parameter        :: RoutineName = 'SeaSt_WaveField_CopySeaSt_WaveFieldType'
   ErrStat = ErrID_None
   ErrMsg  = ''
   if (allocated(SrcSeaSt_WaveFieldTypeData%WaveTime)) then
      LB(1:1) = lbound(SrcSeaSt_WaveFieldTypeData%WaveTime)
      UB(1:1) = ubound(SrcSeaSt_WaveFieldTypeData%WaveTime)
      if (.not. allocated(DstSeaSt_WaveFieldTypeData%WaveTime)) then
         allocate(DstSeaSt_WaveFieldTypeData%WaveTime(LB(1):UB(1)), stat=ErrStat2)
         if (ErrStat2 /= 0) then
            call SetErrStat(ErrID_Fatal, 'Error allocating DstSeaSt_WaveFieldTypeData%WaveTime.', ErrStat, ErrMsg, RoutineName)
            return
         end if
      end if
      DstSeaSt_WaveFieldTypeData%WaveTime = SrcSeaSt_WaveFieldTypeData%WaveTime
   end if
   if (allocated(SrcSeaSt_WaveFieldTypeData%WaveDynP)) then
      LB(1:4) = lbound(SrcSeaSt_WaveFieldTypeData%WaveDynP)
      UB(1:4) = ubound(SrcSeaSt_WaveFieldTypeData%WaveDynP)
      if (.not. allocated(DstSeaSt_WaveFieldTypeData%WaveDynP)) then
         allocate(DstSeaSt_WaveFieldTypeData%WaveDynP(LB(1):UB(1),LB(2):UB(2),LB(3):UB(3),LB(4):UB(4)), stat=ErrStat2)
         if (ErrStat2 /= 0) then
            call SetErrStat(ErrID_Fatal, 'Error allocating DstSeaSt_WaveFieldTypeData%WaveDynP.', ErrStat, ErrMsg, RoutineName)
            return
         end if
      end if
      DstSeaSt_WaveFieldTypeData%WaveDynP = SrcSeaSt_WaveFieldTypeData%WaveDynP
   end if
   if (allocated(SrcSeaSt_WaveFieldTypeData%WaveAcc)) then
      LB(1:5) = lbound(SrcSeaSt_WaveFieldTypeData%WaveAcc)
      UB(1:5) = ubound(SrcSeaSt_WaveFieldTypeData%WaveAcc)
      if (.not. allocated(DstSeaSt_WaveFieldTypeData%WaveAcc)) then
         allocate(DstSeaSt_WaveFieldTypeData%WaveAcc(LB(1):UB(1),LB(2):UB(2),LB(3):UB(3),LB(4):UB(4),LB(5):UB(5)), stat=ErrStat2)
         if (ErrStat2 /= 0) then
            call SetErrStat(ErrID_Fatal, 'Error allocating DstSeaSt_WaveFieldTypeData%WaveAcc.', ErrStat, ErrMsg, RoutineName)
            return
         end if
      end if
      DstSeaSt_WaveFieldTypeData%WaveAcc = SrcSeaSt_WaveFieldTypeData%WaveAcc
   end if
   if (allocated(SrcSeaSt_WaveFieldTypeData%WaveAccMCF)) then
      LB(1:5) = lbound(SrcSeaSt_WaveFieldTypeData%WaveAccMCF)
      UB(1:5) = ubound(SrcSeaSt_WaveFieldTypeData%WaveAccMCF)
      if (.not. allocated(DstSeaSt_WaveFieldTypeData%WaveAccMCF)) then
         allocate(DstSeaSt_WaveFieldTypeData%WaveAccMCF(LB(1):UB(1),LB(2):UB(2),LB(3):UB(3),LB(4):UB(4),LB(5):UB(5)), stat=ErrStat2)
         if (ErrStat2 /= 0) then
            call SetErrStat(ErrID_Fatal, 'Error allocating DstSeaSt_WaveFieldTypeData%WaveAccMCF.', ErrStat, ErrMsg, RoutineName)
            return
         end if
      end if
      DstSeaSt_WaveFieldTypeData%WaveAccMCF = SrcSeaSt_WaveFieldTypeData%WaveAccMCF
   end if
   if (allocated(SrcSeaSt_WaveFieldTypeData%WaveVel)) then
      LB(1:5) = lbound(SrcSeaSt_WaveFieldTypeData%WaveVel)
      UB(1:5) = ubound(SrcSeaSt_WaveFieldTypeData%WaveVel)
      if (.not. allocated(DstSeaSt_WaveFieldTypeData%WaveVel)) then
         allocate(DstSeaSt_WaveFieldTypeData%WaveVel(LB(1):UB(1),LB(2):UB(2),LB(3):UB(3),LB(4):UB(4),LB(5):UB(5)), stat=ErrStat2)
         if (ErrStat2 /= 0) then
            call SetErrStat(ErrID_Fatal, 'Error allocating DstSeaSt_WaveFieldTypeData%WaveVel.', ErrStat, ErrMsg, RoutineName)
            return
         end if
      end if
      DstSeaSt_WaveFieldTypeData%WaveVel = SrcSeaSt_WaveFieldTypeData%WaveVel
   end if
   if (allocated(SrcSeaSt_WaveFieldTypeData%PWaveDynP0)) then
      LB(1:3) = lbound(SrcSeaSt_WaveFieldTypeData%PWaveDynP0)
      UB(1:3) = ubound(SrcSeaSt_WaveFieldTypeData%PWaveDynP0)
      if (.not. allocated(DstSeaSt_WaveFieldTypeData%PWaveDynP0)) then
         allocate(DstSeaSt_WaveFieldTypeData%PWaveDynP0(LB(1):UB(1),LB(2):UB(2),LB(3):UB(3)), stat=ErrStat2)
         if (ErrStat2 /= 0) then
            call SetErrStat(ErrID_Fatal, 'Error allocating DstSeaSt_WaveFieldTypeData%PWaveDynP0.', ErrStat, ErrMsg, RoutineName)
            return
         end if
      end if
      DstSeaSt_WaveFieldTypeData%PWaveDynP0 = SrcSeaSt_WaveFieldTypeData%PWaveDynP0
   end if
   if (allocated(SrcSeaSt_WaveFieldTypeData%PWaveAcc0)) then
      LB(1:4) = lbound(SrcSeaSt_WaveFieldTypeData%PWaveAcc0)
      UB(1:4) = ubound(SrcSeaSt_WaveFieldTypeData%PWaveAcc0)
      if (.not. allocated(DstSeaSt_WaveFieldTypeData%PWaveAcc0)) then
         allocate(DstSeaSt_WaveFieldTypeData%PWaveAcc0(LB(1):UB(1),LB(2):UB(2),LB(3):UB(3),LB(4):UB(4)), stat=ErrStat2)
         if (ErrStat2 /= 0) then
            call SetErrStat(ErrID_Fatal, 'Error allocating DstSeaSt_WaveFieldTypeData%PWaveAcc0.', ErrStat, ErrMsg, RoutineName)
            return
         end if
      end if
      DstSeaSt_WaveFieldTypeData%PWaveAcc0 = SrcSeaSt_WaveFieldTypeData%PWaveAcc0
   end if
   if (allocated(SrcSeaSt_WaveFieldTypeData%PWaveAccMCF0)) then
      LB(1:4) = lbound(SrcSeaSt_WaveFieldTypeData%PWaveAccMCF0)
      UB(1:4) = ubound(SrcSeaSt_WaveFieldTypeData%PWaveAccMCF0)
      if (.not. allocated(DstSeaSt_WaveFieldTypeData%PWaveAccMCF0)) then
         allocate(DstSeaSt_WaveFieldTypeData%PWaveAccMCF0(LB(1):UB(1),LB(2):UB(2),LB(3):UB(3),LB(4):UB(4)), stat=ErrStat2)
         if (ErrStat2 /= 0) then
            call SetErrStat(ErrID_Fatal, 'Error allocating DstSeaSt_WaveFieldTypeData%PWaveAccMCF0.', ErrStat, ErrMsg, RoutineName)
            return
         end if
      end if
      DstSeaSt_WaveFieldTypeData%PWaveAccMCF0 = SrcSeaSt_WaveFieldTypeData%PWaveAccMCF0
   end if
   if (allocated(SrcSeaSt_WaveFieldTypeData%PWaveVel0)) then
      LB(1:4) = lbound(SrcSeaSt_WaveFieldTypeData%PWaveVel0)
      UB(1:4) = ubound(SrcSeaSt_WaveFieldTypeData%PWaveVel0)
      if (.not. allocated(DstSeaSt_WaveFieldTypeData%PWaveVel0)) then
         allocate(DstSeaSt_WaveFieldTypeData%PWaveVel0(LB(1):UB(1),LB(2):UB(2),LB(3):UB(3),LB(4):UB(4)), stat=ErrStat2)
         if (ErrStat2 /= 0) then
            call SetErrStat(ErrID_Fatal, 'Error allocating DstSeaSt_WaveFieldTypeData%PWaveVel0.', ErrStat, ErrMsg, RoutineName)
            return
         end if
      end if
      DstSeaSt_WaveFieldTypeData%PWaveVel0 = SrcSeaSt_WaveFieldTypeData%PWaveVel0
   end if
   if (allocated(SrcSeaSt_WaveFieldTypeData%WaveElev0)) then
      LB(1:1) = lbound(SrcSeaSt_WaveFieldTypeData%WaveElev0)
      UB(1:1) = ubound(SrcSeaSt_WaveFieldTypeData%WaveElev0)
      if (.not. allocated(DstSeaSt_WaveFieldTypeData%WaveElev0)) then
         allocate(DstSeaSt_WaveFieldTypeData%WaveElev0(LB(1):UB(1)), stat=ErrStat2)
         if (ErrStat2 /= 0) then
            call SetErrStat(ErrID_Fatal, 'Error allocating DstSeaSt_WaveFieldTypeData%WaveElev0.', ErrStat, ErrMsg, RoutineName)
            return
         end if
      end if
      DstSeaSt_WaveFieldTypeData%WaveElev0 = SrcSeaSt_WaveFieldTypeData%WaveElev0
   end if
   if (allocated(SrcSeaSt_WaveFieldTypeData%WaveElev1)) then
      LB(1:3) = lbound(SrcSeaSt_WaveFieldTypeData%WaveElev1)
      UB(1:3) = ubound(SrcSeaSt_WaveFieldTypeData%WaveElev1)
      if (.not. allocated(DstSeaSt_WaveFieldTypeData%WaveElev1)) then
         allocate(DstSeaSt_WaveFieldTypeData%WaveElev1(LB(1):UB(1),LB(2):UB(2),LB(3):UB(3)), stat=ErrStat2)
         if (ErrStat2 /= 0) then
            call SetErrStat(ErrID_Fatal, 'Error allocating DstSeaSt_WaveFieldTypeData%WaveElev1.', ErrStat, ErrMsg, RoutineName)
            return
         end if
      end if
      DstSeaSt_WaveFieldTypeData%WaveElev1 = SrcSeaSt_WaveFieldTypeData%WaveElev1
   end if
   if (allocated(SrcSeaSt_WaveFieldTypeData%WaveElev2)) then
      LB(1:3) = lbound(SrcSeaSt_WaveFieldTypeData%WaveElev2)
      UB(1:3) = ubound(SrcSeaSt_WaveFieldTypeData%WaveElev2)
      if (.not. allocated(DstSeaSt_WaveFieldTypeData%WaveElev2)) then
         allocate(DstSeaSt_WaveFieldTypeData%WaveElev2(LB(1):UB(1),LB(2):UB(2),LB(3):UB(3)), stat=ErrStat2)
         if (ErrStat2 /= 0) then
            call SetErrStat(ErrID_Fatal, 'Error allocating DstSeaSt_WaveFieldTypeData%WaveElev2.', ErrStat, ErrMsg, RoutineName)
            return
         end if
      end if
      DstSeaSt_WaveFieldTypeData%WaveElev2 = SrcSeaSt_WaveFieldTypeData%WaveElev2
   end if
   call SeaSt_Interp_CopyParam(SrcSeaSt_WaveFieldTypeData%SeaSt_Interp_p, DstSeaSt_WaveFieldTypeData%SeaSt_Interp_p, CtrlCode, ErrStat2, ErrMsg2)
   call SetErrStat(ErrStat2, ErrMsg2, ErrStat, ErrMsg, RoutineName)
   if (ErrStat >= AbortErrLev) return
   DstSeaSt_WaveFieldTypeData%WaveStMod = SrcSeaSt_WaveFieldTypeData%WaveStMod
   DstSeaSt_WaveFieldTypeData%EffWtrDpth = SrcSeaSt_WaveFieldTypeData%EffWtrDpth
   DstSeaSt_WaveFieldTypeData%MSL2SWL = SrcSeaSt_WaveFieldTypeData%MSL2SWL
   if (allocated(SrcSeaSt_WaveFieldTypeData%WaveElevC)) then
      LB(1:3) = lbound(SrcSeaSt_WaveFieldTypeData%WaveElevC)
      UB(1:3) = ubound(SrcSeaSt_WaveFieldTypeData%WaveElevC)
      if (.not. allocated(DstSeaSt_WaveFieldTypeData%WaveElevC)) then
         allocate(DstSeaSt_WaveFieldTypeData%WaveElevC(LB(1):UB(1),LB(2):UB(2),LB(3):UB(3)), stat=ErrStat2)
         if (ErrStat2 /= 0) then
            call SetErrStat(ErrID_Fatal, 'Error allocating DstSeaSt_WaveFieldTypeData%WaveElevC.', ErrStat, ErrMsg, RoutineName)
            return
         end if
      end if
      DstSeaSt_WaveFieldTypeData%WaveElevC = SrcSeaSt_WaveFieldTypeData%WaveElevC
   end if
   if (allocated(SrcSeaSt_WaveFieldTypeData%WaveElevC0)) then
      LB(1:2) = lbound(SrcSeaSt_WaveFieldTypeData%WaveElevC0)
      UB(1:2) = ubound(SrcSeaSt_WaveFieldTypeData%WaveElevC0)
      if (.not. allocated(DstSeaSt_WaveFieldTypeData%WaveElevC0)) then
         allocate(DstSeaSt_WaveFieldTypeData%WaveElevC0(LB(1):UB(1),LB(2):UB(2)), stat=ErrStat2)
         if (ErrStat2 /= 0) then
            call SetErrStat(ErrID_Fatal, 'Error allocating DstSeaSt_WaveFieldTypeData%WaveElevC0.', ErrStat, ErrMsg, RoutineName)
            return
         end if
      end if
      DstSeaSt_WaveFieldTypeData%WaveElevC0 = SrcSeaSt_WaveFieldTypeData%WaveElevC0
   end if
   if (allocated(SrcSeaSt_WaveFieldTypeData%WaveDirArr)) then
      LB(1:1) = lbound(SrcSeaSt_WaveFieldTypeData%WaveDirArr)
      UB(1:1) = ubound(SrcSeaSt_WaveFieldTypeData%WaveDirArr)
      if (.not. allocated(DstSeaSt_WaveFieldTypeData%WaveDirArr)) then
         allocate(DstSeaSt_WaveFieldTypeData%WaveDirArr(LB(1):UB(1)), stat=ErrStat2)
         if (ErrStat2 /= 0) then
            call SetErrStat(ErrID_Fatal, 'Error allocating DstSeaSt_WaveFieldTypeData%WaveDirArr.', ErrStat, ErrMsg, RoutineName)
            return
         end if
      end if
      DstSeaSt_WaveFieldTypeData%WaveDirArr = SrcSeaSt_WaveFieldTypeData%WaveDirArr
   end if
   DstSeaSt_WaveFieldTypeData%WtrDens = SrcSeaSt_WaveFieldTypeData%WtrDens
   DstSeaSt_WaveFieldTypeData%RhoXg = SrcSeaSt_WaveFieldTypeData%RhoXg
   DstSeaSt_WaveFieldTypeData%WaveDirMin = SrcSeaSt_WaveFieldTypeData%WaveDirMin
   DstSeaSt_WaveFieldTypeData%WaveDirMax = SrcSeaSt_WaveFieldTypeData%WaveDirMax
   DstSeaSt_WaveFieldTypeData%WaveDir = SrcSeaSt_WaveFieldTypeData%WaveDir
   DstSeaSt_WaveFieldTypeData%WaveMultiDir = SrcSeaSt_WaveFieldTypeData%WaveMultiDir
end subroutine

subroutine SeaSt_WaveField_DestroySeaSt_WaveFieldType(SeaSt_WaveFieldTypeData, ErrStat, ErrMsg)
   type(SeaSt_WaveFieldType), intent(inout) :: SeaSt_WaveFieldTypeData
   integer(IntKi),  intent(  out) :: ErrStat
   character(*),    intent(  out) :: ErrMsg
   integer(IntKi)                 :: ErrStat2
   character(ErrMsgLen)           :: ErrMsg2
   character(*), parameter        :: RoutineName = 'SeaSt_WaveField_DestroySeaSt_WaveFieldType'
   ErrStat = ErrID_None
   ErrMsg  = ''
   if (allocated(SeaSt_WaveFieldTypeData%WaveTime)) then
      deallocate(SeaSt_WaveFieldTypeData%WaveTime)
   end if
   if (allocated(SeaSt_WaveFieldTypeData%WaveDynP)) then
      deallocate(SeaSt_WaveFieldTypeData%WaveDynP)
   end if
   if (allocated(SeaSt_WaveFieldTypeData%WaveAcc)) then
      deallocate(SeaSt_WaveFieldTypeData%WaveAcc)
   end if
   if (allocated(SeaSt_WaveFieldTypeData%WaveAccMCF)) then
      deallocate(SeaSt_WaveFieldTypeData%WaveAccMCF)
   end if
   if (allocated(SeaSt_WaveFieldTypeData%WaveVel)) then
      deallocate(SeaSt_WaveFieldTypeData%WaveVel)
   end if
   if (allocated(SeaSt_WaveFieldTypeData%PWaveDynP0)) then
      deallocate(SeaSt_WaveFieldTypeData%PWaveDynP0)
   end if
   if (allocated(SeaSt_WaveFieldTypeData%PWaveAcc0)) then
      deallocate(SeaSt_WaveFieldTypeData%PWaveAcc0)
   end if
   if (allocated(SeaSt_WaveFieldTypeData%PWaveAccMCF0)) then
      deallocate(SeaSt_WaveFieldTypeData%PWaveAccMCF0)
   end if
   if (allocated(SeaSt_WaveFieldTypeData%PWaveVel0)) then
      deallocate(SeaSt_WaveFieldTypeData%PWaveVel0)
   end if
   if (allocated(SeaSt_WaveFieldTypeData%WaveElev0)) then
      deallocate(SeaSt_WaveFieldTypeData%WaveElev0)
   end if
   if (allocated(SeaSt_WaveFieldTypeData%WaveElev1)) then
      deallocate(SeaSt_WaveFieldTypeData%WaveElev1)
   end if
   if (allocated(SeaSt_WaveFieldTypeData%WaveElev2)) then
      deallocate(SeaSt_WaveFieldTypeData%WaveElev2)
   end if
   call SeaSt_Interp_DestroyParam(SeaSt_WaveFieldTypeData%SeaSt_Interp_p, ErrStat2, ErrMsg2)
   call SetErrStat(ErrStat2, ErrMsg2, ErrStat, ErrMsg, RoutineName)
   if (allocated(SeaSt_WaveFieldTypeData%WaveElevC)) then
      deallocate(SeaSt_WaveFieldTypeData%WaveElevC)
   end if
   if (allocated(SeaSt_WaveFieldTypeData%WaveElevC0)) then
      deallocate(SeaSt_WaveFieldTypeData%WaveElevC0)
   end if
   if (allocated(SeaSt_WaveFieldTypeData%WaveDirArr)) then
      deallocate(SeaSt_WaveFieldTypeData%WaveDirArr)
   end if
end subroutine

subroutine SeaSt_WaveField_PackSeaSt_WaveFieldType(Buf, Indata)
   type(PackBuffer), intent(inout) :: Buf
   type(SeaSt_WaveFieldType), intent(in) :: InData
   character(*), parameter         :: RoutineName = 'SeaSt_WaveField_PackSeaSt_WaveFieldType'
   if (Buf%ErrStat >= AbortErrLev) return
   call RegPack(Buf, allocated(InData%WaveTime))
   if (allocated(InData%WaveTime)) then
      call RegPackBounds(Buf, 1, lbound(InData%WaveTime), ubound(InData%WaveTime))
      call RegPack(Buf, InData%WaveTime)
   end if
   call RegPack(Buf, allocated(InData%WaveDynP))
   if (allocated(InData%WaveDynP)) then
      call RegPackBounds(Buf, 4, lbound(InData%WaveDynP), ubound(InData%WaveDynP))
      call RegPack(Buf, InData%WaveDynP)
   end if
   call RegPack(Buf, allocated(InData%WaveAcc))
   if (allocated(InData%WaveAcc)) then
      call RegPackBounds(Buf, 5, lbound(InData%WaveAcc), ubound(InData%WaveAcc))
      call RegPack(Buf, InData%WaveAcc)
   end if
   call RegPack(Buf, allocated(InData%WaveAccMCF))
   if (allocated(InData%WaveAccMCF)) then
      call RegPackBounds(Buf, 5, lbound(InData%WaveAccMCF), ubound(InData%WaveAccMCF))
      call RegPack(Buf, InData%WaveAccMCF)
   end if
   call RegPack(Buf, allocated(InData%WaveVel))
   if (allocated(InData%WaveVel)) then
      call RegPackBounds(Buf, 5, lbound(InData%WaveVel), ubound(InData%WaveVel))
      call RegPack(Buf, InData%WaveVel)
   end if
   call RegPack(Buf, allocated(InData%PWaveDynP0))
   if (allocated(InData%PWaveDynP0)) then
      call RegPackBounds(Buf, 3, lbound(InData%PWaveDynP0), ubound(InData%PWaveDynP0))
      call RegPack(Buf, InData%PWaveDynP0)
   end if
   call RegPack(Buf, allocated(InData%PWaveAcc0))
   if (allocated(InData%PWaveAcc0)) then
      call RegPackBounds(Buf, 4, lbound(InData%PWaveAcc0), ubound(InData%PWaveAcc0))
      call RegPack(Buf, InData%PWaveAcc0)
   end if
   call RegPack(Buf, allocated(InData%PWaveAccMCF0))
   if (allocated(InData%PWaveAccMCF0)) then
      call RegPackBounds(Buf, 4, lbound(InData%PWaveAccMCF0), ubound(InData%PWaveAccMCF0))
      call RegPack(Buf, InData%PWaveAccMCF0)
   end if
   call RegPack(Buf, allocated(InData%PWaveVel0))
   if (allocated(InData%PWaveVel0)) then
      call RegPackBounds(Buf, 4, lbound(InData%PWaveVel0), ubound(InData%PWaveVel0))
      call RegPack(Buf, InData%PWaveVel0)
   end if
   call RegPack(Buf, allocated(InData%WaveElev0))
   if (allocated(InData%WaveElev0)) then
      call RegPackBounds(Buf, 1, lbound(InData%WaveElev0), ubound(InData%WaveElev0))
      call RegPack(Buf, InData%WaveElev0)
   end if
   call RegPack(Buf, allocated(InData%WaveElev1))
   if (allocated(InData%WaveElev1)) then
      call RegPackBounds(Buf, 3, lbound(InData%WaveElev1), ubound(InData%WaveElev1))
      call RegPack(Buf, InData%WaveElev1)
   end if
   call RegPack(Buf, allocated(InData%WaveElev2))
   if (allocated(InData%WaveElev2)) then
      call RegPackBounds(Buf, 3, lbound(InData%WaveElev2), ubound(InData%WaveElev2))
      call RegPack(Buf, InData%WaveElev2)
   end if
   call SeaSt_Interp_PackParam(Buf, InData%SeaSt_Interp_p) 
   call RegPack(Buf, InData%WaveStMod)
   call RegPack(Buf, InData%EffWtrDpth)
   call RegPack(Buf, InData%MSL2SWL)
   call RegPack(Buf, allocated(InData%WaveElevC))
   if (allocated(InData%WaveElevC)) then
      call RegPackBounds(Buf, 3, lbound(InData%WaveElevC), ubound(InData%WaveElevC))
      call RegPack(Buf, InData%WaveElevC)
   end if
   call RegPack(Buf, allocated(InData%WaveElevC0))
   if (allocated(InData%WaveElevC0)) then
      call RegPackBounds(Buf, 2, lbound(InData%WaveElevC0), ubound(InData%WaveElevC0))
      call RegPack(Buf, InData%WaveElevC0)
   end if
   call RegPack(Buf, allocated(InData%WaveDirArr))
   if (allocated(InData%WaveDirArr)) then
      call RegPackBounds(Buf, 1, lbound(InData%WaveDirArr), ubound(InData%WaveDirArr))
      call RegPack(Buf, InData%WaveDirArr)
   end if
   call RegPack(Buf, InData%WtrDens)
   call RegPack(Buf, InData%RhoXg)
   call RegPack(Buf, InData%WaveDirMin)
   call RegPack(Buf, InData%WaveDirMax)
   call RegPack(Buf, InData%WaveDir)
   call RegPack(Buf, InData%WaveMultiDir)
   if (RegCheckErr(Buf, RoutineName)) return
end subroutine

subroutine SeaSt_WaveField_UnPackSeaSt_WaveFieldType(Buf, OutData)
   type(PackBuffer), intent(inout)    :: Buf
   type(SeaSt_WaveFieldType), intent(inout) :: OutData
   character(*), parameter            :: RoutineName = 'SeaSt_WaveField_UnPackSeaSt_WaveFieldType'
   integer(IntKi)  :: LB(5), UB(5)
   integer(IntKi)  :: stat
   logical         :: IsAllocAssoc
   if (Buf%ErrStat /= ErrID_None) return
   if (allocated(OutData%WaveTime)) deallocate(OutData%WaveTime)
   call RegUnpack(Buf, IsAllocAssoc)
   if (RegCheckErr(Buf, RoutineName)) return
   if (IsAllocAssoc) then
      call RegUnpackBounds(Buf, 1, LB, UB)
      if (RegCheckErr(Buf, RoutineName)) return
      allocate(OutData%WaveTime(LB(1):UB(1)),stat=stat)
      if (stat /= 0) then 
         call SetErrStat(ErrID_Fatal, 'Error allocating OutData%WaveTime.', Buf%ErrStat, Buf%ErrMsg, RoutineName)
         return
      end if
      call RegUnpack(Buf, OutData%WaveTime)
      if (RegCheckErr(Buf, RoutineName)) return
   end if
   if (allocated(OutData%WaveDynP)) deallocate(OutData%WaveDynP)
   call RegUnpack(Buf, IsAllocAssoc)
   if (RegCheckErr(Buf, RoutineName)) return
   if (IsAllocAssoc) then
      call RegUnpackBounds(Buf, 4, LB, UB)
      if (RegCheckErr(Buf, RoutineName)) return
      allocate(OutData%WaveDynP(LB(1):UB(1),LB(2):UB(2),LB(3):UB(3),LB(4):UB(4)),stat=stat)
      if (stat /= 0) then 
         call SetErrStat(ErrID_Fatal, 'Error allocating OutData%WaveDynP.', Buf%ErrStat, Buf%ErrMsg, RoutineName)
         return
      end if
      call RegUnpack(Buf, OutData%WaveDynP)
      if (RegCheckErr(Buf, RoutineName)) return
   end if
   if (allocated(OutData%WaveAcc)) deallocate(OutData%WaveAcc)
   call RegUnpack(Buf, IsAllocAssoc)
   if (RegCheckErr(Buf, RoutineName)) return
   if (IsAllocAssoc) then
      call RegUnpackBounds(Buf, 5, LB, UB)
      if (RegCheckErr(Buf, RoutineName)) return
      allocate(OutData%WaveAcc(LB(1):UB(1),LB(2):UB(2),LB(3):UB(3),LB(4):UB(4),LB(5):UB(5)),stat=stat)
      if (stat /= 0) then 
         call SetErrStat(ErrID_Fatal, 'Error allocating OutData%WaveAcc.', Buf%ErrStat, Buf%ErrMsg, RoutineName)
         return
      end if
      call RegUnpack(Buf, OutData%WaveAcc)
      if (RegCheckErr(Buf, RoutineName)) return
   end if
   if (allocated(OutData%WaveAccMCF)) deallocate(OutData%WaveAccMCF)
   call RegUnpack(Buf, IsAllocAssoc)
   if (RegCheckErr(Buf, RoutineName)) return
   if (IsAllocAssoc) then
      call RegUnpackBounds(Buf, 5, LB, UB)
      if (RegCheckErr(Buf, RoutineName)) return
      allocate(OutData%WaveAccMCF(LB(1):UB(1),LB(2):UB(2),LB(3):UB(3),LB(4):UB(4),LB(5):UB(5)),stat=stat)
      if (stat /= 0) then 
         call SetErrStat(ErrID_Fatal, 'Error allocating OutData%WaveAccMCF.', Buf%ErrStat, Buf%ErrMsg, RoutineName)
         return
      end if
      call RegUnpack(Buf, OutData%WaveAccMCF)
      if (RegCheckErr(Buf, RoutineName)) return
   end if
   if (allocated(OutData%WaveVel)) deallocate(OutData%WaveVel)
   call RegUnpack(Buf, IsAllocAssoc)
   if (RegCheckErr(Buf, RoutineName)) return
   if (IsAllocAssoc) then
      call RegUnpackBounds(Buf, 5, LB, UB)
      if (RegCheckErr(Buf, RoutineName)) return
      allocate(OutData%WaveVel(LB(1):UB(1),LB(2):UB(2),LB(3):UB(3),LB(4):UB(4),LB(5):UB(5)),stat=stat)
      if (stat /= 0) then 
         call SetErrStat(ErrID_Fatal, 'Error allocating OutData%WaveVel.', Buf%ErrStat, Buf%ErrMsg, RoutineName)
         return
      end if
      call RegUnpack(Buf, OutData%WaveVel)
      if (RegCheckErr(Buf, RoutineName)) return
   end if
   if (allocated(OutData%PWaveDynP0)) deallocate(OutData%PWaveDynP0)
   call RegUnpack(Buf, IsAllocAssoc)
   if (RegCheckErr(Buf, RoutineName)) return
   if (IsAllocAssoc) then
      call RegUnpackBounds(Buf, 3, LB, UB)
      if (RegCheckErr(Buf, RoutineName)) return
      allocate(OutData%PWaveDynP0(LB(1):UB(1),LB(2):UB(2),LB(3):UB(3)),stat=stat)
      if (stat /= 0) then 
         call SetErrStat(ErrID_Fatal, 'Error allocating OutData%PWaveDynP0.', Buf%ErrStat, Buf%ErrMsg, RoutineName)
         return
      end if
      call RegUnpack(Buf, OutData%PWaveDynP0)
      if (RegCheckErr(Buf, RoutineName)) return
   end if
   if (allocated(OutData%PWaveAcc0)) deallocate(OutData%PWaveAcc0)
   call RegUnpack(Buf, IsAllocAssoc)
   if (RegCheckErr(Buf, RoutineName)) return
   if (IsAllocAssoc) then
      call RegUnpackBounds(Buf, 4, LB, UB)
      if (RegCheckErr(Buf, RoutineName)) return
      allocate(OutData%PWaveAcc0(LB(1):UB(1),LB(2):UB(2),LB(3):UB(3),LB(4):UB(4)),stat=stat)
      if (stat /= 0) then 
         call SetErrStat(ErrID_Fatal, 'Error allocating OutData%PWaveAcc0.', Buf%ErrStat, Buf%ErrMsg, RoutineName)
         return
      end if
      call RegUnpack(Buf, OutData%PWaveAcc0)
      if (RegCheckErr(Buf, RoutineName)) return
   end if
   if (allocated(OutData%PWaveAccMCF0)) deallocate(OutData%PWaveAccMCF0)
   call RegUnpack(Buf, IsAllocAssoc)
   if (RegCheckErr(Buf, RoutineName)) return
   if (IsAllocAssoc) then
      call RegUnpackBounds(Buf, 4, LB, UB)
      if (RegCheckErr(Buf, RoutineName)) return
      allocate(OutData%PWaveAccMCF0(LB(1):UB(1),LB(2):UB(2),LB(3):UB(3),LB(4):UB(4)),stat=stat)
      if (stat /= 0) then 
         call SetErrStat(ErrID_Fatal, 'Error allocating OutData%PWaveAccMCF0.', Buf%ErrStat, Buf%ErrMsg, RoutineName)
         return
      end if
      call RegUnpack(Buf, OutData%PWaveAccMCF0)
      if (RegCheckErr(Buf, RoutineName)) return
   end if
   if (allocated(OutData%PWaveVel0)) deallocate(OutData%PWaveVel0)
   call RegUnpack(Buf, IsAllocAssoc)
   if (RegCheckErr(Buf, RoutineName)) return
   if (IsAllocAssoc) then
      call RegUnpackBounds(Buf, 4, LB, UB)
      if (RegCheckErr(Buf, RoutineName)) return
      allocate(OutData%PWaveVel0(LB(1):UB(1),LB(2):UB(2),LB(3):UB(3),LB(4):UB(4)),stat=stat)
      if (stat /= 0) then 
         call SetErrStat(ErrID_Fatal, 'Error allocating OutData%PWaveVel0.', Buf%ErrStat, Buf%ErrMsg, RoutineName)
         return
      end if
      call RegUnpack(Buf, OutData%PWaveVel0)
      if (RegCheckErr(Buf, RoutineName)) return
   end if
   if (allocated(OutData%WaveElev0)) deallocate(OutData%WaveElev0)
   call RegUnpack(Buf, IsAllocAssoc)
   if (RegCheckErr(Buf, RoutineName)) return
   if (IsAllocAssoc) then
      call RegUnpackBounds(Buf, 1, LB, UB)
      if (RegCheckErr(Buf, RoutineName)) return
      allocate(OutData%WaveElev0(LB(1):UB(1)),stat=stat)
      if (stat /= 0) then 
         call SetErrStat(ErrID_Fatal, 'Error allocating OutData%WaveElev0.', Buf%ErrStat, Buf%ErrMsg, RoutineName)
         return
      end if
      call RegUnpack(Buf, OutData%WaveElev0)
      if (RegCheckErr(Buf, RoutineName)) return
   end if
   if (allocated(OutData%WaveElev1)) deallocate(OutData%WaveElev1)
   call RegUnpack(Buf, IsAllocAssoc)
   if (RegCheckErr(Buf, RoutineName)) return
   if (IsAllocAssoc) then
      call RegUnpackBounds(Buf, 3, LB, UB)
      if (RegCheckErr(Buf, RoutineName)) return
      allocate(OutData%WaveElev1(LB(1):UB(1),LB(2):UB(2),LB(3):UB(3)),stat=stat)
      if (stat /= 0) then 
         call SetErrStat(ErrID_Fatal, 'Error allocating OutData%WaveElev1.', Buf%ErrStat, Buf%ErrMsg, RoutineName)
         return
      end if
      call RegUnpack(Buf, OutData%WaveElev1)
      if (RegCheckErr(Buf, RoutineName)) return
   end if
   if (allocated(OutData%WaveElev2)) deallocate(OutData%WaveElev2)
   call RegUnpack(Buf, IsAllocAssoc)
   if (RegCheckErr(Buf, RoutineName)) return
   if (IsAllocAssoc) then
      call RegUnpackBounds(Buf, 3, LB, UB)
      if (RegCheckErr(Buf, RoutineName)) return
      allocate(OutData%WaveElev2(LB(1):UB(1),LB(2):UB(2),LB(3):UB(3)),stat=stat)
      if (stat /= 0) then 
         call SetErrStat(ErrID_Fatal, 'Error allocating OutData%WaveElev2.', Buf%ErrStat, Buf%ErrMsg, RoutineName)
         return
      end if
      call RegUnpack(Buf, OutData%WaveElev2)
      if (RegCheckErr(Buf, RoutineName)) return
   end if
   call SeaSt_Interp_UnpackParam(Buf, OutData%SeaSt_Interp_p) ! SeaSt_Interp_p 
   call RegUnpack(Buf, OutData%WaveStMod)
   if (RegCheckErr(Buf, RoutineName)) return
   call RegUnpack(Buf, OutData%EffWtrDpth)
   if (RegCheckErr(Buf, RoutineName)) return
   call RegUnpack(Buf, OutData%MSL2SWL)
   if (RegCheckErr(Buf, RoutineName)) return
   if (allocated(OutData%WaveElevC)) deallocate(OutData%WaveElevC)
   call RegUnpack(Buf, IsAllocAssoc)
   if (RegCheckErr(Buf, RoutineName)) return
   if (IsAllocAssoc) then
      call RegUnpackBounds(Buf, 3, LB, UB)
      if (RegCheckErr(Buf, RoutineName)) return
      allocate(OutData%WaveElevC(LB(1):UB(1),LB(2):UB(2),LB(3):UB(3)),stat=stat)
      if (stat /= 0) then 
         call SetErrStat(ErrID_Fatal, 'Error allocating OutData%WaveElevC.', Buf%ErrStat, Buf%ErrMsg, RoutineName)
         return
      end if
      call RegUnpack(Buf, OutData%WaveElevC)
      if (RegCheckErr(Buf, RoutineName)) return
   end if
   if (allocated(OutData%WaveElevC0)) deallocate(OutData%WaveElevC0)
   call RegUnpack(Buf, IsAllocAssoc)
   if (RegCheckErr(Buf, RoutineName)) return
   if (IsAllocAssoc) then
      call RegUnpackBounds(Buf, 2, LB, UB)
      if (RegCheckErr(Buf, RoutineName)) return
      allocate(OutData%WaveElevC0(LB(1):UB(1),LB(2):UB(2)),stat=stat)
      if (stat /= 0) then 
         call SetErrStat(ErrID_Fatal, 'Error allocating OutData%WaveElevC0.', Buf%ErrStat, Buf%ErrMsg, RoutineName)
         return
      end if
      call RegUnpack(Buf, OutData%WaveElevC0)
      if (RegCheckErr(Buf, RoutineName)) return
   end if
   if (allocated(OutData%WaveDirArr)) deallocate(OutData%WaveDirArr)
   call RegUnpack(Buf, IsAllocAssoc)
   if (RegCheckErr(Buf, RoutineName)) return
   if (IsAllocAssoc) then
      call RegUnpackBounds(Buf, 1, LB, UB)
      if (RegCheckErr(Buf, RoutineName)) return
      allocate(OutData%WaveDirArr(LB(1):UB(1)),stat=stat)
      if (stat /= 0) then 
         call SetErrStat(ErrID_Fatal, 'Error allocating OutData%WaveDirArr.', Buf%ErrStat, Buf%ErrMsg, RoutineName)
         return
      end if
      call RegUnpack(Buf, OutData%WaveDirArr)
      if (RegCheckErr(Buf, RoutineName)) return
   end if
   call RegUnpack(Buf, OutData%WtrDens)
   if (RegCheckErr(Buf, RoutineName)) return
   call RegUnpack(Buf, OutData%RhoXg)
   if (RegCheckErr(Buf, RoutineName)) return
   call RegUnpack(Buf, OutData%WaveDirMin)
   if (RegCheckErr(Buf, RoutineName)) return
   call RegUnpack(Buf, OutData%WaveDirMax)
   if (RegCheckErr(Buf, RoutineName)) return
   call RegUnpack(Buf, OutData%WaveDir)
   if (RegCheckErr(Buf, RoutineName)) return
   call RegUnpack(Buf, OutData%WaveMultiDir)
   if (RegCheckErr(Buf, RoutineName)) return
end subroutine
END MODULE SeaSt_WaveField_Types
!ENDOFREGISTRYGENERATEDFILE

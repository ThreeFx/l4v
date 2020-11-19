(*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * SPDX-License-Identifier: GPL-2.0-only
 *)

chapter "Platform Definitions"

theory Platform
imports
  "Lib.Defs"
  "Lib.Lib"
  "Word_Lib.WordSetup"
  Setup_Locale
begin

context Arch begin global_naming ARM

text \<open>
  This theory lists platform-specific types and basic constants, in particular
  the types of interrupts and physical addresses, constants for the
  kernel location, the offsets between physical and virtual kernel
  addresses, as well as the range of IRQs on the platform.
\<close>

type_synonym irq = "10 word"
type_synonym paddr = word32

abbreviation (input) "toPAddr \<equiv> id"
abbreviation (input) "fromPAddr \<equiv> id"

definition
  cacheLineBits :: nat where
  "cacheLineBits = 6"

definition
  pageColourBits :: nat where
  "pageColourBits = undefined" \<comment> \<open> unused \<close>

definition
  cacheLine :: nat where
  "cacheLine = 2^cacheLineBits"

(* Arch specific kernel base address used for haskell spec *)
definition
  pptrBase :: word32 where
  "pptrBase \<equiv> 0xe0000000"

definition
  physBase :: word32 where
  "physBase \<equiv> 0x40000000"

definition
  pptrBaseOffset :: word32 where
  "pptrBaseOffset \<equiv> pptrBase - physBase"

definition
  ptrFromPAddr :: "paddr \<Rightarrow> word32" where
  "ptrFromPAddr paddr \<equiv> paddr + pptrBaseOffset"

definition
  addrFromPPtr :: "word32 \<Rightarrow> paddr" where
  "addrFromPPtr pptr \<equiv> pptr - pptrBaseOffset"

definition
  minIRQ :: "irq" where
  "minIRQ \<equiv> 0"

definition
  maxIRQ :: "irq" where
  "maxIRQ \<equiv> 160"

end

end

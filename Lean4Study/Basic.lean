import Mathlib

namespace Lean4Study

-- A first arithmetic proof using a mathlib tactic.
theorem two_add_two : (2 + 2 : ℕ) = 4 := by
  norm_num

-- A polynomial identity over the real numbers.
theorem square_add (a b : ℝ) : (a + b) ^ 2 = a ^ 2 + 2 * a * b + b ^ 2 := by
  ring

end Lean4Study

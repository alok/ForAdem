


import Mathlib.Tactic.Ring
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.FieldSimp
import LeanCopilot

open LeanCopilot

#eval cudaAvailable


/-

If this doesn't work easily, just give up and use the models they provide.

1. Install `uv`. Run `curl -LsSf https://astral.sh/uv/install.sh | sh` in the command line and follow the instructions. Make sure to add `uv` to your PATH. Ask GPT if you don't know how to do this or what that means.
2. Install `uvicorn` in the command line. Do this by running `pip install uvicorn` in the command line.
3. Make sure the model is up and running, e.g., by going to `.lake/packages/LeanCopilot/python` (in the command line) and running `uvicorn server:app --port 23337`.

-/

def claude : ExternalGenerator := {
  name := "claude"
  host := "localhost"
  port := 23337
}

#eval generate claude "n : ℕ\n⊢ gcd n n = n"


/-

Adem: you should be able to use `select_premises`, `search_proof`, and `suggest_tactics` in tactic blocks (within the scope of a `by` block).

You may also use the `aesop` tactic from mathlib. `exact?`, `apply?`, `simp`, `omega`, `rw`, `calc`, `ring_nf`, `unfold`, `induction` *may* help, but not necessarily.
-/

/-- Naive recursive definition of sumUpTo. -/
def sumUpTo (n : Nat) : Nat := match n with
  | 0 => 0
  | n+1 => n + 1 + sumUpTo n

/--The fast formula-/
def fastSumUpTo (n : Nat) : Nat := n * (n + 1) / 2

/-- Helper lemma.-/
theorem splitFastSum (n : Nat) : fastSumUpTo (n+1) = n + 1 + fastSumUpTo n := by
  induction n with
  | zero => rfl
  | succ n ih =>
    unfold fastSumUpTo
    ring_nf
    -- leansearch is a tool that can help you search for proofs.
    -- #leansearch "mul both sides."

    /-

    artifact of previous attempt:

    ```lean
    calc
      (n + 1) * (n + 2) / 2
        = (n + 1) + n * (n + 1) / 2 := by ring_nf
      _ = (n + 1) + fastSumUpTo n := by rw [ih]
    ```
  -/
    sorry -- fill this in


/-- A helper lemma. Adem: make intermediate steps explicit, it helps the proof.

Long guide: https://terrytao.wordpress.com/2023/12/05/a-slightly-longer-lean-4-proof-tour/
 -/
theorem splitSum (n : Nat) : sumUpTo (n + 1) = n + 1 + sumUpTo n := by
  induction n with
  | zero => rfl
  | succ n ih =>
    simp [sumUpTo]

/-- TODO: fill this in. -/
theorem sumUpTo_eq_fastSumUpTo (n : Nat) : sumUpTo n = fastSumUpTo n := by
  induction n with
  | zero => rfl
  | succ n ih => calc
    sumUpTo (n + 1) = n + 1 + sumUpTo n := splitSum n
    _ = n + 1 + fastSumUpTo n := by rw [ih]
    _ = fastSumUpTo (n + 1) := by sorry




def main : IO Unit :=
  IO.println s!"Hello!"

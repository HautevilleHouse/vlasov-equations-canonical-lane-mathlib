import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace VlasovEquationsCanonicalLaneLean

structure ElectromagneticCouplingPackage where
  electricField : Type u
  magneticField : Type v
  maxwellEquations : Prop
  couplingTerm : Prop
  selfConsistentField : Prop

structure ElectromagneticCouplingEvidence (E : ElectromagneticCouplingPackage) where
  maxwellEquationsClosed : E.maxwellEquations
  couplingTermClosed : E.couplingTerm
  selfConsistentFieldClosed : E.selfConsistentField

def ElectromagneticCouplingClosed (E : ElectromagneticCouplingPackage) : Prop :=
  E.maxwellEquations ∧ E.couplingTerm ∧ E.selfConsistentField

theorem electromagnetic_coupling_closed_from_evidence
    (E : ElectromagneticCouplingPackage) (Ev : ElectromagneticCouplingEvidence E) :
    ElectromagneticCouplingClosed E := by
  exact And.intro Ev.maxwellEquationsClosed
    (And.intro Ev.couplingTermClosed Ev.selfConsistentFieldClosed)

end VlasovEquationsCanonicalLaneLean
end HautevilleHouse
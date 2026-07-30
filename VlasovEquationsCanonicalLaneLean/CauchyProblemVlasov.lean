import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace VlasovEquationsCanonicalLaneLean

structure CauchyProblemVlasovPackage {V : VlasovEquationPackage}
    (E : VlasovEquationEvidence V) where
  wellPosedness : Prop
  globalExistence : Prop
  uniquenessClass : Prop
  continuousDependence : Prop
  stabilityUnderForcing : Prop

structure CauchyProblemVlasovEvidence {V : VlasovEquationPackage}
    {E : VlasovEquationEvidence V}
    (C : CauchyProblemVlasovPackage E) where
  wellPosednessClosed : C.wellPosedness
  globalExistenceClosed : C.globalExistence
  uniquenessClassClosed : C.uniquenessClass
  continuousDependenceClosed : C.continuousDependence
  stabilityUnderForcingClosed : C.stabilityUnderForcing

def CauchyProblemVlasovClosed {V : VlasovEquationPackage}
    {E : VlasovEquationEvidence V}
    (C : CauchyProblemVlasovPackage E) : Prop :=
  C.wellPosedness ∧ C.globalExistence ∧
  C.uniquenessClass ∧ C.continuousDependence ∧
  C.stabilityUnderForcing

theorem cauchy_problem_vlasov_closed_from_evidence
    {V : VlasovEquationPackage} {E : VlasovEquationEvidence V}
    (C : CauchyProblemVlasovPackage E)
    (Ev : CauchyProblemVlasovEvidence C) :
    CauchyProblemVlasovClosed C := by
  exact And.intro Ev.wellPosednessClosed
    (And.intro Ev.globalExistenceClosed
      (And.intro Ev.uniquenessClassClosed
        (And.intro Ev.continuousDependenceClosed
          Ev.stabilityUnderForcingClosed)))

end VlasovEquationsCanonicalLaneLean
end HautevilleHouse
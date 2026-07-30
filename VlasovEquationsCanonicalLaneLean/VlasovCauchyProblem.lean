import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace VlasovEquationsCanonicalLaneLean

structure VlasovCauchyProblem where
  initialData : Type u
  wellPosedness : Prop
  globalExistence : Prop
  uniqueness : Prop
  regularityPropagation : Prop
  stability : Prop

structure VlasovCauchyProblemEvidence (V : VlasovCauchyProblem) where
  initialDataClosed : V.initialData
  wellPosednessClosed : V.wellPosedness
  globalExistenceClosed : V.globalExistence
  uniquenessClosed : V.uniqueness
  regularityPropagationClosed : V.regularityPropagation
  stabilityClosed : V.stability

def VlasovCauchyProblemClosed (V : VlasovCauchyProblem) : Prop :=
  V.initialData ∧ V.wellPosedness ∧ V.globalExistence ∧ V.uniqueness ∧ V.regularityPropagation ∧ V.stability

theorem vlasov_cauchy_problem_closed_from_evidence
    (V : VlasovCauchyProblem) (E : VlasovCauchyProblemEvidence V) :
    VlasovCauchyProblemClosed V := by
  exact And.intro E.initialDataClosed
    (And.intro E.wellPosednessClosed
      (And.intro E.globalExistenceClosed
        (And.intro E.uniquenessClosed
          (And.intro E.regularityPropagationClosed E.stabilityClosed))))

end VlasovEquationsCanonicalLaneLean
end HautevilleHouse
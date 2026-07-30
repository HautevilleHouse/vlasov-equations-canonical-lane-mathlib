import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace VlasovEquationsCanonicalLaneLean

structure NonlinearLandauDampingPackage where
  smallPerturbation : Prop
  echoPhenomena : Prop
  analyticSmoothing : Prop
  longTimeBehavior : Prop
  scattering : Prop

structure NonlinearLandauDampingEvidence (N : NonlinearLandauDampingPackage) where
  smallPerturbationClosed : N.smallPerturbation
  echoPhenomenaClosed : N.echoPhenomena
  analyticSmoothingClosed : N.analyticSmoothing
  longTimeBehaviorClosed : N.longTimeBehavior
  scatteringClosed : N.scattering

def NonlinearLandauDampingClosed (N : NonlinearLandauDampingPackage) : Prop :=
  N.smallPerturbation ∧ N.echoPhenomena ∧ N.analyticSmoothing ∧ N.longTimeBehavior ∧ N.scattering

theorem nonlinear_landau_damping_closed_from_evidence
    (N : NonlinearLandauDampingPackage) (E : NonlinearLandauDampingEvidence N) :
    NonlinearLandauDampingClosed N := by
  exact And.intro E.smallPerturbationClosed
    (And.intro E.echoPhenomenaClosed
      (And.intro E.analyticSmoothingClosed
        (And.intro E.longTimeBehaviorClosed E.scatteringClosed)))

end VlasovEquationsCanonicalLaneLean
end HautevilleHouse
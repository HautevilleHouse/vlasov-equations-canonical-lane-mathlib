import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace VlasovEquationsCanonicalLaneLean

structure KineticLandauDampingPackage {V : VlasovEquationPackage}
    (E : VlasovEquationEvidence V) where
  plasmaWaveModel : Type u
  dispersionRelation : Prop
  linearDampingRate : Prop
  nonlinearScattering : Prop
  analyticExtension : Prop
  asymptoticDecay : Prop

structure KineticLandauDampingEvidence {V : VlasovEquationPackage}
    {E : VlasovEquationEvidence V}
    (L : KineticLandauDampingPackage E) where
  dispersionRelationClosed : L.dispersionRelation
  linearDampingRateClosed : L.linearDampingRate
  nonlinearScatteringClosed : L.nonlinearScattering
  analyticExtensionClosed : L.analyticExtension
  asymptoticDecayClosed : L.asymptoticDecay

def KineticLandauDampingClosed {V : VlasovEquationPackage}
    {E : VlasovEquationEvidence V}
    (L : KineticLandauDampingPackage E) : Prop :=
  L.dispersionRelation ∧ L.linearDampingRate ∧
  L.nonlinearScattering ∧ L.analyticExtension ∧
  L.asymptoticDecay

theorem kinetic_landau_damping_closed_from_evidence
    {V : VlasovEquationPackage} {E : VlasovEquationEvidence V}
    (L : KineticLandauDampingPackage E)
    (Ev : KineticLandauDampingEvidence L) :
    KineticLandauDampingClosed L := by
  exact And.intro Ev.dispersionRelationClosed
    (And.intro Ev.linearDampingRateClosed
      (And.intro Ev.nonlinearScatteringClosed
        (And.intro Ev.analyticExtensionClosed
          Ev.asymptoticDecayClosed)))

end VlasovEquationsCanonicalLaneLean
end HautevilleHouse
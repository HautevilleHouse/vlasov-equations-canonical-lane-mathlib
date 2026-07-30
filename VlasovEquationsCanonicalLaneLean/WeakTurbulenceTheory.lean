import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace VlasovEquationsCanonicalLaneLean

structure WeakTurbulencePackage where
  velocityDistribution : Type u
  waveParticleInteraction : Type v
  quasilinearTheory : Prop
  diffusionCoefficient : Prop
  turbulentSpectrum : Prop

structure WeakTurbulenceEvidence (W : WeakTurbulencePackage) where
  quasilinearTheoryClosed : W.quasilinearTheory
  diffusionCoefficientClosed : W.diffusionCoefficient
  turbulentSpectrumClosed : W.turbulentSpectrum

def WeakTurbulenceClosed (W : WeakTurbulencePackage) : Prop :=
  W.quasilinearTheory ∧ W.diffusionCoefficient ∧ W.turbulentSpectrum

theorem weak_turbulence_closed_from_evidence (W : WeakTurbulencePackage)
    (E : WeakTurbulenceEvidence W) : WeakTurbulenceClosed W := by
  exact And.intro E.quasilinearTheoryClosed (And.intro E.diffusionCoefficientClosed E.turbulentSpectrumClosed)

end VlasovEquationsCanonicalLaneLean
end HautevilleHouse
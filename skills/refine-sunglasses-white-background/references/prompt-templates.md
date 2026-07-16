# 图像编辑与返工模板

将方括号内容替换为当前图片的事实描述。保持提示明确、短而严格；不要添加原图没有的创意要求。

## 主编辑模板

```text
Use case: precise-object-edit
Asset type: e-commerce sunglasses product photo on pure white

Input roles:
- Image 1 is the edit target and the sole authority for product structure, materials, visible lens colors, lens transparency, camera angle, framing, scale, position, and orientation.
- Image 2 is the approved effect sample. Use it only for lens cleanliness, controlled commercial rendering quality, pure-white background, sharpness, and no product reflection below.
- Any additional reference image is quality-only and must not supply frame design, lens color, angle, or proportions.

Primary request:
Refine Image 1 into a clean commercial white-background product image. Preserve the product exactly. Clean the lenses and remove only visible contamination and environmental/lighting reflections.

Lens color lock:
The visible lens appearance in Image 1 is [describe exact hue map], with [light/medium/dark] brightness, [low/medium/high] saturation, and [transparent/semi-transparent/polarized/mirrored] behavior. Match that visible hue, brightness, saturation, gradient direction, coating behavior, and transparency. Preserve view-dependent front/back coating color. Do not infer color from Image 2 or from the folder name. Do not intensify saturation, darken the lenses, flatten them into solid color, or make transparent lenses opaque.

Cleanliness:
No dust, spots, scratches, haze, white dots, lines, light strips, hotspots, softbox, camera, photographer, room, or environment reflections. Replace removed reflections with a smooth continuation of the original lens color and transparency, not a new color.

Background and grounding:
Uniform pure white studio background. No seam, gradient patch, dirt, tabletop, floor highlight, product reflection, mirrored outline, gray reflection band, or broad halo. Allow only a nearly invisible tight contact shadow.

Invariants:
Keep frame shape, lens shape, bridge, temples, hinges, vents, holes, decorations, materials, colors, camera angle, framing, proportions, position, and orientation exactly as Image 1. Remove text, labels, stickers, model numbers, and watermarks. Add nothing. Keep the full product sharp and realistic without waxy smoothing, edge halos, or redesign.
```

## 颜色/透明度返工模板

失败成品仅用于指出问题；重新以原图为编辑目标。

```text
Re-edit from the original Image 1. The previous result failed because the lens color or transparency drifted.

Change only the lens rendering needed to remove contamination and environmental reflections. Restore the exact visible lens hue, brightness, saturation, gradient direction, and transparency of Image 1: [state the observed appearance]. The lens must remain [transparent/semi-transparent/polarized/mirrored] to the same degree as the original.

Do not make silver lenses dark gray or black. Do not make pale transparent yellow lenses saturated gold or opaque. Do not make smoky transparent lenses solid black. Do not turn green coating blue/purple or make blue coating electric cyan. Preserve any genuine view-dependent front/back coating difference visible in Image 1.

Keep every product part, material, angle, framing, scale, position, pure-white background, sharpness, and no-reflection-below treatment unchanged. No text, logo, label, watermark, new decoration, environment reflection, light strip, hotspot, or product reflection below.
```

## 镜片反射返工模板

```text
Re-edit from the original Image 1. Keep the already correct product geometry and the original lens hue, brightness, saturation, gradient, coating behavior, and transparency.

Remove the remaining [spot/line/hotspot/environment reflection] from [left/right/both] lens only. Fill that area with a seamless continuation of the adjacent original lens rendering. Do not recolor, darken, saturate, flatten, or redesign any part. Keep the background pure white and keep the area below the product free of reflections and broad halos.
```

## 逐张验收记录模板

```text
Relative path: [path]
Structure/angle/composition: PASS | FAIL — [reason]
Lens hue/saturation/brightness: PASS | FAIL — [reason]
Lens transparency/coating behavior: PASS | FAIL — [reason]
Lens cleanliness/reflections: PASS | FAIL — [reason]
White background/below-product reflection: PASS | FAIL — [reason]
Sharpness/material realism: PASS | FAIL — [reason]
Decision: ACCEPT | REGENERATE
```


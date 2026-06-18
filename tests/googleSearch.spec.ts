import { test, expect } from '@playwright/test';

test('Buscar un término existente y obtener resultados relevantes', async ({ page }) => {
  // Dado que el usuario está en la página principal de Google Search
  await page.goto('https://www.google.com');

  // Manejo del cartel de cookies de Google si llega a aparecer
  const acceptCookiesBtn = page.locator('button:has-text("Acepto"), button:has-text("Accept all")');
  if (await acceptCookiesBtn.count() > 0) {
    await acceptCookiesBtn.first().click();
  }

  // Cuando ingresa "automatización de pruebas QA" en la barra de búsqueda
  const searchBar = page.locator('textarea[name="q"], input[name="q"]');
  await searchBar.fill('automatización de pruebas QA');

  // Y presiona la tecla Enter
  await searchBar.press('Enter');

  // Entonces el sistema debe redirigir a la página de resultados
  await expect(page).toHaveURL(/.*search.*/);

  // Y el primer resultado debe contener el término "automatización de pruebas QA"
  const firstResult = page.locator('h3').first();
  await expect(firstResult).toBeVisible();
  
  const textContent: string | null = await firstResult.textContent();
  expect(textContent?.toLowerCase()).toContain('pruebas');
});

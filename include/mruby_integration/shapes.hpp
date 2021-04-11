#pragma once

#include "mruby.h"

//void SetShapesTexture(Texture2D texture, Rectangle source);

// Basic shapes drawing functions
//void DrawPixel(int posX, int posY, Color color);
//void DrawPixelV(Vector2 position, Color color);
//void DrawLine(int startPosX, int startPosY, int endPosX, int endPosY, Color color);
//void DrawLineV(Vector2 startPos, Vector2 endPos, Color color);
//void DrawLineEx(Vector2 startPos, Vector2 endPos, float thick, Color color);
//void DrawLineBezier(Vector2 startPos, Vector2 endPos, float thick, Color color);
//void DrawLineBezierQuad(Vector2 startPos, Vector2 endPos, Vector2 controlPos, float thick, Color color);
//void DrawLineStrip(Vector2 *points, int pointsCount, Color color);
//void DrawCircle(int centerX, int centerY, float radius, Color color);
//void DrawCircleSector(Vector2 center, float radius, float startAngle, float endAngle, int segments, Color color);
//void DrawCircleSectorLines(Vector2 center, float radius, float startAngle, float endAngle, int segments, Color color);
//void DrawCircleGradient(int centerX, int centerY, float radius, Color color1, Color color2);
//void DrawCircleV(Vector2 center, float radius, Color color);
//void DrawCircleLines(int centerX, int centerY, float radius, Color color);
//void DrawEllipse(int centerX, int centerY, float radiusH, float radiusV, Color color);
//void DrawEllipseLines(int centerX, int centerY, float radiusH, float radiusV, Color color);
//void DrawRing(Vector2 center, float innerRadius, float outerRadius, float startAngle, float endAngle, int segments, Color color);
//void DrawRingLines(Vector2 center, float innerRadius, float outerRadius, float startAngle, float endAngle, int segments, Color color);

mrb_value MrbDrawRectangle(mrb_state*, mrb_value);
//void DrawRectangleV(Vector2 position, Vector2 size, Color color);
//void DrawRectangleRec(Rectangle rec, Color color);
//void DrawRectanglePro(Rectangle rec, Vector2 origin, float rotation, Color color);
//void DrawRectangleGradientV(int posX, int posY, int width, int height, Color color1, Color color2);
//void DrawRectangleGradientH(int posX, int posY, int width, int height, Color color1, Color color2);
//void DrawRectangleGradientEx(Rectangle rec, Color col1, Color col2, Color col3, Color col4);
//void DrawRectangleLines(int posX, int posY, int width, int height, Color color);
//void DrawRectangleLinesEx(Rectangle rec, int lineThick, Color color);
//void DrawRectangleRounded(Rectangle rec, float roundness, int segments, Color color);
//void DrawRectangleRoundedLines(Rectangle rec, float roundness, int segments, int lineThick, Color color);
//void DrawTriangle(Vector2 v1, Vector2 v2, Vector2 v3, Color color);
//void DrawTriangleLines(Vector2 v1, Vector2 v2, Vector2 v3, Color color);
//void DrawTriangleFan(Vector2 *points, int pointsCount, Color color);
//void DrawTriangleStrip(Vector2 *points, int pointsCount, Color color);
//void DrawPoly(Vector2 center, int sides, float radius, float rotation, Color color);
//void DrawPolyLines(Vector2 center, int sides, float radius, float rotation, Color color);

// Basic shapes collision detection functions
//bool CheckCollisionRecs(Rectangle rec1, Rectangle rec2);
//bool CheckCollisionCircles(Vector2 center1, float radius1, Vector2 center2, float radius2);
//bool CheckCollisionCircleRec(Vector2 center, float radius, Rectangle rec);
//bool CheckCollisionPointRec(Vector2 point, Rectangle rec);
//bool CheckCollisionPointCircle(Vector2 point, Vector2 center, float radius);
//bool CheckCollisionPointTriangle(Vector2 point, Vector2 p1, Vector2 p2, Vector2 p3);
//bool CheckCollisionLines(Vector2 startPos1, Vector2 endPos1, Vector2 startPos2, Vector2 endPos2, Vector2 *collisionPoint);
//Rectangle GetCollisionRec(Rectangle rec1, Rectangle rec2);

void appendShapes(mrb_state*);
